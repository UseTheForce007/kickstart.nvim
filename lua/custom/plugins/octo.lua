return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- Icons are optional but highly recommended for a GUI feel
    'nvim-tree/nvim-web-devicons', 
  },
  config = function()
    require('octo').setup({
      enable_builtin = true, -- Uses Neovim's native layout features
      default_to_projects = false,
      ssh_aliases = {},
      mappings = {
        repo = {
          create_issue = { lhs = '<localleader>ic', desc = 'create issue' },
        },
      },
    })
    
    -- Helpful Keymaps for GitHub Actions
    local map = vim.keymap.set
    map('n', '<leader>gi', '<cmd>Octo issue list<cr>', { desc = 'GitHub: [G]et [I]ssues' })
    map('n', '<leader>gic', '<cmd>Octo issue create<cr>', { desc = 'GitHub: Create [I]ssue' })
    map('n', '<leader>gp', '<cmd>Octo pr list<cr>', { desc = 'GitHub: [G]et [P]ull Requests' })
    map('n', '<leader>gpc', '<cmd>Octo pr create<cr>', { desc = 'GitHub: Create [P]ull Request' })
    map('n', '<leader>gn', '<cmd>Octo notification stream<cr>', { desc = 'GitHub: [G]et [N]otifications' })
  end,
}