local set = vim.opt

set.relativenumber = true
set.number = true
set.autoindent = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smarttab = true
set.mouse = "a"
set.updatetime = 100
set.expandtab = true
set.hlsearch = false
set.cursorline = true
set.splitbelow = true
set.splitright = true
set.ttimeoutlen = 150
set.wrap = false

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]
