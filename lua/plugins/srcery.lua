return {
	"srcery-colors/srcery-vim",
	as = "srcery",
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.cmd.colorscheme("srcery")
	end,
}
