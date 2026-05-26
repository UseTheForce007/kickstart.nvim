-- =========================================================================
-- Raspberry Pi Remote Development Environment
-- Location: lua/custom/remote_sync.lua
-- =========================================================================

local function get_project_root(file_path)
  return file_path:match('^(.*[/\\]pi%-project)[/\\]')
end

local pi_host = 'pi'
local pi_remote_path = '~/pi-project/'

local function sync_project()
  local file_path = vim.api.nvim_buf_get_name(0)
  if file_path == '' then
    vim.notify('Open a file inside pi-project before syncing', vim.log.levels.WARN)
    return
  end

  local project_root = get_project_root(file_path)
  if not project_root then
    vim.notify('Current file is not inside pi-project', vim.log.levels.WARN)
    return
  end

  vim.fn.jobstart({
    'rsync',
    '-avz',
    '--exclude=.git',
    '--exclude=build/',
    './',
    pi_host .. ':' .. pi_remote_path,
  }, {
    cwd = project_root,
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.schedule(function()
          vim.notify('Synced to Raspberry Pi (' .. pi_host .. ')', vim.log.levels.INFO)
        end)
      else
        vim.schedule(function()
          vim.notify('Sync failed (verify passwordless SSH keys)', vim.log.levels.ERROR)
        end)
      end
    end,
  })
end

vim.api.nvim_create_user_command('PiSync', sync_project, {
  desc = 'Sync pi-project files to the Raspberry Pi',
})

vim.keymap.set('n', '<leader>tp', function()
  vim.cmd('vsplit | terminal ssh -t ' .. pi_host .. ' "cd ~/pi-project && exec bash -l"')
end, { desc = '[T]erminal to [P]i' })

vim.keymap.set('n', '<leader>ps', sync_project, { desc = '[P]i [S]ync' })