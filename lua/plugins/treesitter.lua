local function setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "lua", "go", "json", "yaml", "markdown", "markdown_inline" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	config = setup,
}
