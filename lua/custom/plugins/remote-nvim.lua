return{
"inhesrom/remote-ssh.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("remote-ssh").setup({
      -- Options can be left default
    })
  end
}