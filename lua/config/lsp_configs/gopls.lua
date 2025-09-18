local module = {}

function module.get_config(capabilities)
	local c = require('lspconfig').gopls
	c['capabilities'] = capabilities
	return c
end

return module
