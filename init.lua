require("global")
require("keymaps")
require("plugins")
require("appearance")

-- APPEARANCE

-- PACKER AUTO SOURCE
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- UTILS
vim.g['gitblame_enabled'] = 0

-- TREESITTER
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "javascript", "python", "json", "yaml", "haskell", "latex" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
local opt = vim.opt
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- LSP
local lspconfig = require 'lspconfig'
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
  end)

require("lsp-format").setup {}



-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Enable the following language servers
local servers = { 'gopls', 'pyright', 'tsserver', 'jsonls', 'ltex' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = require "lsp-format".on_attach
  }
end

local luasnip = require 'luasnip'
local cmp = require'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
}

-- DAP
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-go').setup()
require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "javascript" }) do
  require("dap").configurations[language] = {
    {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require'dap.utils'.pick_process,
        cwd = "${workspaceFolder}",
      }
    }
  }
end
