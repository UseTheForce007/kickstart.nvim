-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
require('custom.remote_sync')
require('custom.pi_clangd')
require('custom.difftool')
require('custom.undotree')

return {
	require("custom.plugins.lemminx"),
}
