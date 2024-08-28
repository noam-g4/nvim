require("nyadgar.packer")
require("nyadgar.set")

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<C-l>", vim.cmd.bnext)
vim.keymap.set("n", "<C-h>", vim.cmd.bprevious)
vim.keymap.set("n", "<Esc>", function() end)
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

vim.cmd("autocmd ColorScheme * hi DiffAdd      guifg=NONE          guibg=#003300")
vim.cmd("autocmd ColorScheme * hi DiffChange   guifg=NONE          guibg=#003355")
vim.cmd("autocmd ColorScheme * hi DiffText     guifg=NONE          guibg=#887766")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.supports_method("textDocument/rename") then
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		end
	end,
})
