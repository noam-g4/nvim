local map = vim.api.nvim_set_keymap

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- DEBUGGER
map('n', '<Leader>dc', ':lua require("dap").continue()<CR>')
map('n', '<Leader>db', ':lua require("dap").toggle_breakpoint()<CR>')
map('n', '<Leader>do', ':lua require("dap").step_over()<CR>')
map('n', '<Leader>di', ':lua require("dap").step_into()<CR>')
map('n', '<Leader>dO', ':lua require("dap").step_out()<CR>')
map('n', '<Leader>dt', ':lua require("dap").repl.open()<CR>')
map('n', '<Leader>de', ':lua require("dap").terminate()<CR>')
map('n', '<Leader>dB', ':lua require("dap").clear_breakpoints()<CR>')
map('n', '<Leader>dT', ':lua require("dap-go").debug_test()<CR>')


-- GLOBAL
map('i', 'jj', '<ESC>')

map('i', 'jl', '<Right>')
map('i', '{', '{}<Left>')
map('i', '{<CR>', '{<CR>}<Esc>O<Tab>')
map('i', '{{', '{')
map('i', '(', '()<Left>')
map('i', '((', '(')
map('i', '[', '[]<Left>')
map('i', '[<CR>', '[<CR>]<Esc>O<Tab>')
map('i', '[[', '[')
map('i', '"', '""<Left>')
map('i', '""', '"')
map('i', '\'', '\'\'<Left>')

map('', 'io', 'o<ESC>O')
map('', 'Zz', '<c-w>|')
map('', 'Zo', '<c-w>=')
map('', ';', ':')
map('', ':', ';')

map('v', '<C-c>', '"*y')
map('n', '<C-a>', 'gg<S-V><S-G>')

map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-H>', '<C-W><C-H>')

-- NERDTREE
 map('n', 'Tt', ':NERDTreeToggle<CR>')

-- LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<cr>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>')
map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>')
map('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
map('n', 'gr', ':lua vim.lsp.buf.references()<cr>')
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>')
map('n', 'K', ':lua vim.lsp.buf.hover()<cr>')
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- TELESCOPE
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
