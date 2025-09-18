local module = {}
---@brief
---
--- https://github.com/mrjosh/helm-ls
---
--- Helm Language server. (This LSP is in early development)
---
--- `helm Language server` can be installed by following the instructions [here](https://github.com/mrjosh/helm-ls).
---
--- The default `cmd` assumes that the `helm_ls` binary can be found in `$PATH`.
---
--- If need Helm file highlight use [vim-helm](https://github.com/towolf/vim-helm) plugin.

---@type vim.lsp.Config
function module.get_config(capabilities)
	local c = require('lspconfig').helm_ls
	c['filetypes'] = { 'helm', 'yaml.helm_values', 'yaml' }
	return c
end

return module
