return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Register and enable Julia language server using lspconfig defaults.
      vim.lsp.config('julials', {})
      vim.lsp.enable('julials')
    end,
  },
}