local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- VISUAL:
  -- use 'tomasiser/vim-code-dark'
  use 'ellisonleao/gruvbox.nvim'
  -- use 'vim-airline/vim-airline'
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
  use 'puremourning/vimspector'
  use 'christoomey/vim-tmux-navigator'
  use 'mtdl9/vim-log-highlighting'
  use 'preservim/nerdtree'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'https://github.com/neo4j-contrib/cypher-vim-syntax'
  use 'djoshea/vim-autoread'

  -- DEBUGER
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'

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
