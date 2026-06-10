local M = {}

function M.get_config(capabilities)
	local c = vim.lsp.config['buf_ls']
  c['cmd'] = { 'buf', 'lsp', 'serve', '--log-format=text' }
  c['filetypes'] = { 'proto', 'buf-config' }
  c['root_markers'] = { 'buf.yaml', '.git' }
  c['reuse_client'] = function(client, config)
    -- `buf lsp serve` is meant to be used with multiple workspaces.
    return client.name == config.name
  end
	return c
end

return M
