return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		opts = {},
	},
}
