call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

"for use with telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

"For lsp server
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'

"https://youtu.be/7KVgMAd16NQ
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'


call plug#end()

"sourcing
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/nvimconfig.vim
source $HOME/.config/nvim/config/fzf.vim
source $HOME/.config/nvim/config/lsp-config.vim


lua <<EOF
require("lsp")
require("treesitter")
require("completion")
require("require-lsp")
require("lus_lsp")
EOF

