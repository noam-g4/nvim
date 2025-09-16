local module = {}

function module.get_config(capabilities)
	return {
		capabilities = capabilities,
		cmd = { 'lua-language-server' },
		filetypes = { 'lua' },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	}
end

return module
