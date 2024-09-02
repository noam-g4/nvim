local function keymaps()
	local d = require("dap")
	local w = require("dap.ui.widgets")
	vim.keymap.set("n", "<leader>dc", function()
		d.continue()
	end)
	vim.keymap.set("n", "<leader>do", function()
		d.step_over()
	end)
	vim.keymap.set("n", "<leader>di", function()
		d.step_into()
	end)
	vim.keymap.set("n", "<leader>dp", function()
		d.step_out()
	end)
	vim.keymap.set("n", "<Leader>db", function()
		d.toggle_breakpoint()
	end)
	vim.keymap.set("n", "<Leader>dB", function()
		d.set_breakpoint()
	end)
	vim.keymap.set("n", "<Leader>dlp", function()
		d.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
	end)
	vim.keymap.set("n", "<Leader>dr", function()
		d.repl.open()
	end)
	vim.keymap.set("n", "<Leader>dl", function()
		d.run_last()
	end)
	vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
		w.hover()
	end)
	vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
		w.preview()
	end)
	vim.keymap.set("n", "<Leader>df", function()
		w.centered_float(w.frames)
	end)
	vim.keymap.set("n", "<Leader>ds", function()
		w.centered_float(w.scopes)
	end)
	vim.keymap.set("n", "<Leader>dt", function()
		d.terminate()
	end)
end
return {

	{ "mfussenegger/nvim-dap", config = keymaps },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		opts = {},
	},
	{ "leoluz/nvim-dap-go", opts = {} },
}
