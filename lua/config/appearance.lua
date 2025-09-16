vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.undofile = true

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
	enabled = true,                    -- Ensure this is set to true
	highlight_changed_variables = true, -- You may tweak other options
	highlight_new_as_changed = true
}

require("nvim-treesitter.configs").setup({
	-- Enable highlight module
	highlight = {
		enable = true,                           -- Enables Tree-sitter-based syntax highlighting
		additional_vim_regex_highlighting = false, -- Disable fallback regex highlighting
	},
})
