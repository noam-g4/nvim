local module = {}

function module.get_config(capabilities)
    local c = vim.lsp.config['ts_ls']
    c['capabilities'] = capabilities
    return c
end

return module
