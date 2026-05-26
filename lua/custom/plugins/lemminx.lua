local function diagnostics_enabled()
	if vim.diagnostic and vim.diagnostic.is_enabled then
		return vim.diagnostic.is_enabled()
	end

	return vim.g.diagnostics_enabled ~= false
end

local function set_diagnostics(enabled)
	if vim.diagnostic and vim.diagnostic.enable then
		vim.diagnostic.enable(enabled)
	end
	vim.g.diagnostics_enabled = enabled
end

return {
	{
		'mason-org/mason-lspconfig.nvim',
		config = function()
			pcall(function()
				local mlsp = require('mason-lspconfig')

				-- Create diagnostics toggle command
				vim.api.nvim_create_user_command('DiagnosticsToggle', function()
					set_diagnostics(not diagnostics_enabled())
				end, { desc = 'Toggle all diagnostic messages' })

				mlsp.setup_handlers({
					-- default handler (optional)
					function(server_name)
					end,

					-- specific handler for lemminx
					lemminx = function()
						local ok, lspconfig = pcall(require, 'lspconfig')
						if not ok then return end

						lspconfig.lemminx.setup {
							filetypes = { 'xml', 'xsd', 'xsl', 'svg', 'urdf', 'xacro' },
						}
					end,
				})
			end)
		end,
	},
}
