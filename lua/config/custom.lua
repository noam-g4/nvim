vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.keymap.set("n", "<C-l>", vim.cmd.bnext)
vim.keymap.set("n", "<C-h>", vim.cmd.bprevious)
vim.keymap.set("n", "<Esc>", function() end)
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

vim.cmd("autocmd ColorScheme * hi DiffAdd      guifg=NONE          guibg=#003300")
vim.cmd("autocmd ColorScheme * hi DiffChange   guifg=NONE          guibg=#003355")
vim.cmd("autocmd ColorScheme * hi DiffText     guifg=NONE          guibg=#887766")
