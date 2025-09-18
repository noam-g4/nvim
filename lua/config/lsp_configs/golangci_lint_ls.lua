local module = {}

function module.get_config(_)
	return require('lspconfig').golangci_lint_ls
end

return module
