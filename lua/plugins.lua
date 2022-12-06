local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- VISUAL:
  -- use 'ellisonleao/gruvbox.nvim'
  -- use 'Mofiqul/vscode.nvim'
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'https://github.com/p00f/nvim-ts-rainbow'

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ryanoasis/vim-devicons'

  -- LSP
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use "lukas-reineke/lsp-format.nvim"

  -- UTILS
  use 'tpope/vim-commentary'
  use 'http://github.com/tpope/vim-surround'
  use 'fatih/vim-go'
  use 'christoomey/vim-tmux-navigator'
  use 'mtdl9/vim-log-highlighting'
  use 'preservim/nerdtree'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'https://github.com/neo4j-contrib/cypher-vim-syntax'
  use 'djoshea/vim-autoread'
  use { "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

  -- DEBUGER
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile" 
  }

  -- COMPLETION
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- SNIPPETS
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- GIT
  use 'tpope/vim-fugitive'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'sindrets/diffview.nvim'
  use 'airblade/vim-gitgutter'
  use 'https://github.com/f-person/git-blame.nvim'

  -- FORMAT
  use 'prettier/vim-prettier'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
