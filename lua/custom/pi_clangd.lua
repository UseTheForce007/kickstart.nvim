local M = {}

local pi_host = 'pi'
local pi_sysroot = vim.fn.expand('~/.cache/pi-clangd-sysroot')
local module_name = 'lspconfig.configs'

local original_searchers = {}
for index, searcher in ipairs(package.searchers or package.loaders) do
  original_searchers[index] = searcher
end

local include_dirs = {
  'usr/include',
  'usr/local/include',
  'usr/include/arm-linux-gnueabihf',
  'usr/include/aarch64-linux-gnu',
}

local function sync_directory(source_path, destination_path, on_done)
  vim.fn.mkdir(vim.fn.fnamemodify(destination_path, ':h'), 'p')

  return vim.fn.jobstart({
    'rsync',
    '-a',
    '--delete',
    pi_host .. ':' .. source_path,
    destination_path,
  }, {
    on_exit = function(_, exit_code)
      vim.schedule(function()
        if exit_code == 0 then
          on_done()
        else
          vim.notify('Pi sysroot sync failed for ' .. source_path, vim.log.levels.ERROR)
        end
      end)
    end,
  })
end

  local function load_module_through_original_searchers(name)
    for _, searcher in ipairs(original_searchers) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        local ok, module = pcall(loader)
        if not ok then
          error(module, 2)
        end

        return module
      end
    end

    error("module '" .. name .. "' not found", 2)
  end

  local function apply_clangd_flags(configs)
    if not configs or not configs.clangd or not configs.clangd.default_config then
      return false
    end

    configs.clangd.default_config.init_options = vim.tbl_deep_extend('force', configs.clangd.default_config.init_options or {}, {
      fallbackFlags = M.fallback_flags(),
    })

    return true
  end

  local function patch_loaded_configs()
    local configs = package.loaded[module_name]
    if type(configs) ~= 'table' then
      return false
    end

    return apply_clangd_flags(configs)
  end

  local function install_loader_hook()
    for index, searcher in ipairs(package.searchers or package.loaders) do
      if searcher == M._searcher then
        return
      end
    end

    local searchers = package.searchers or package.loaders
    table.insert(searchers, 1, M._searcher)
  end

  function M._searcher(name)
    if name ~= module_name then
      return nil
    end

    local ok, configs = pcall(load_module_through_original_searchers, name)
    if not ok then
      return nil
    end

    apply_clangd_flags(configs)

    return function()
      return configs
    end
  end

function M.fallback_flags()
  local flags = {}

  for _, relative_dir in ipairs(include_dirs) do
    local absolute_dir = pi_sysroot .. '/' .. relative_dir
    if vim.uv.fs_stat(absolute_dir) then
      vim.list_extend(flags, { '-isystem', absolute_dir })
    end
  end

  return flags
end

function M.sync_sysroot()
  local paths_to_sync = {}

  for _, relative_dir in ipairs(include_dirs) do
    local remote_path = '/' .. relative_dir .. '/'
    local local_path = pi_sysroot .. '/' .. relative_dir .. '/'
    table.insert(paths_to_sync, {
      remote_path = remote_path,
      local_path = local_path,
    })
  end

  local next_index = 1

  local function sync_next()
    local current = paths_to_sync[next_index]
    if not current then
      vim.notify('Pi sysroot synced to ' .. pi_sysroot, vim.log.levels.INFO)
      return
    end

    sync_directory(current.remote_path, current.local_path, function()
      next_index = next_index + 1
      sync_next()
    end)
  end

  sync_next()
end

patch_loaded_configs()
install_loader_hook()

vim.api.nvim_create_user_command('PiClangdSync', M.sync_sysroot, {
  desc = 'Sync Raspberry Pi headers for clangd autocomplete',
})

return M