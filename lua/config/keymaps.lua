vim.g.mapleader = " "

-- open side explore
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>")

-- jj instead of esc
vim.keymap.set("n", "<Esc>", function() end)
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- code block in curly braces
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O<TAB>", { silent = true })

-- useful lsp stuff
vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.keymap.set("n", "<leader>cr", ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>sd", ":lua vim.diagnostic.open_float()<CR>")

-- awesome telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, { desc = 'buffer commits' })
vim.keymap.set('n', '<leader>xx', builtin.diagnostics, { desc = 'diagnostics' })

vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'goto references' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'goto implementations' })
vim.keymap.set('n', 'sO', builtin.lsp_document_symbols, { desc = 'document symbols' })

vim.keymap.set('n', '2d', ":TodoTelescope<CR>", { desc = 'todos' })

-- custom git hack
local git = require('config/git')
vim.keymap.set('n', '<leader>gb', git.open_diffview_from_blame, { desc = 'git history on blame' })

-- debugger keymaps setup function
local d = require("dap")
local w = require("dap.ui.widgets")
require("nvim-dap-virtual-text").setup()
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
