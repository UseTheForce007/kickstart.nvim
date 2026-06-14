return {
  'stevearc/conform.nvim',
  opts = function(_, opts)
    local enabled_filetypes = {
      c = true,
      cpp = true,
      objc = true,
      objcpp = true,
    }

    opts.format_on_save = function(bufnr)
      if enabled_filetypes[vim.bo[bufnr].filetype] then
        return { timeout_ms = 500 }
      end

      return nil
    end

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.c = { 'clang_format' }
    opts.formatters_by_ft.cpp = { 'clang_format' }
    opts.formatters_by_ft.objc = { 'clang_format' }
    opts.formatters_by_ft.objcpp = { 'clang_format' }
  end,
}