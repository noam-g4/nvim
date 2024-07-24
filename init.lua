require("nyadgar.packer")
require("nyadgar.set")

vim.keymap.set("n", "<leader>ee", vim.cmd.Ex)
vim.keymap.set("n", "<C-]>", vim.cmd.bnext)
vim.keymap.set("n", "<C-[>", vim.cmd.bprevious)

vim.cmd("autocmd ColorScheme * hi DiffAdd      guifg=NONE          guibg=#003300")
vim.cmd("autocmd ColorScheme * hi DiffChange   guifg=NONE          guibg=#003355")
vim.cmd("autocmd ColorScheme * hi DiffText     guifg=NONE          guibg=#887766")
