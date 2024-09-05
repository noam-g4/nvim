return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true
		vim.keymap.set("n", "<Leader>t", function()
			vim.cmd([[ NvimTreeToggle ]])
		end)

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
