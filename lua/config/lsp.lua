local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_servers = {
	"gopls",
	"golangci_lint_ls",
	"helm_ls",
	"jdtls",
	"lua_ls"
}

for _, lsp_name in ipairs(lsp_servers) do
	local ok, server_config = pcall(require, "config.lsp_configs." .. lsp_name)
	if not ok then
		vim.notify("Error loading config for " .. lsp_name, vim.log.levels.ERROR)
	else
		vim.lsp.config[lsp_name] = server_config.get_config(capabilities)
		vim.lsp.enable(lsp_name)
	end
end
