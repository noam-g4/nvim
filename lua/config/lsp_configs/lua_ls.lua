local module = {}

function module.get_config(capabilities)
	local c = vim.lsp.config['lua_ls']
	c['capabilities'] = capabilities
	c['settings'] = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			}
		}
	}
	return c
end

return module
