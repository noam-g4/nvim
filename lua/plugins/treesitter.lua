return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    lazy = false,
    build = ":TSUpdate",
    -- main = "nvim-treesitter.configs",
    -- opts = {
    --     auto_install = true,
    --     highlight = {
    --         enable = true,                             -- Enables Tree-sitter-based syntax highlighting
    --         additional_vim_regex_highlighting = false, -- Disable fallback regex highlighting
    --     },
    -- },
}
