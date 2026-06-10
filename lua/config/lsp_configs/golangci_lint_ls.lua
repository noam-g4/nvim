local module = {}

function module.get_config(_)
	return vim.lsp.config['golangci_lint_ls']
end

return module
