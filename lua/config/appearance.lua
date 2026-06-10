vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.splitright = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 4


vim.diagnostic.config({
    virtual_text = true,
})

vim.cmd [[colorscheme tokyonight]]

require('telescope').setup {
    defaults = {
        sorting_strategy = "ascending", -- Set to "descending" for reverse order
        layout_config = {
            prompt_position = "bottom", -- Optional: Position prompt at the top of the window
        },
    },
    pickers = {
        lsp_document_symbols = {
            sorting_strategy = "ascending", -- Change this to "descending" for reversed order
        },
    },
}

require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- Ensure this is set to true
    highlight_changed_variables = true, -- You may tweak other options
    highlight_new_as_changed = true
}

local dap = require('dap')

-- This suppresses any window opening during initialization
dap.listeners.after.event_initialized["no_windows"] = function()
    vim.cmd("silent! q") -- Close the opened debug windows
end
