local M = {}

function M.get_config(capabilities)
    local c = vim.lsp.config['yamlls']
    c['capabilities'] = capabilities
    return c
end

return M
