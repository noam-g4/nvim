local module = {}

function module.get_config(capabilities)
	local c = vim.lsp.config['gopls']
	c['capabilities'] = capabilities
	return c
end

return module
