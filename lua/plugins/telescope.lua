return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		require("telescope").setup()

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
		vim.keymap.set("n", "<leader>xx", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>f/", function()
			builtin.grep_string({ search = vim.fn.input("grep> ") })
		end)
	end,
}
