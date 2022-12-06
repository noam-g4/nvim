vim.g.gruvbox_flat_style = "hard"
vim.g.gruvbox_italic_comments = true
vim.g.gruvbox_transparent = true

vim.cmd[[colorscheme gruvbox-flat]]

require('lualine').setup {
  options = { theme = 'auto' }
}
