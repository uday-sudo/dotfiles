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
Plug 'glepnir/lspsaga.nvim'

"https://youtu.be/7KVgMAd16NQ
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

"coc.nvim only for coc-explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"sourcing
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/nvimconfig.vim

lua <<EOF
require("lsp")
require("treesitter")
require("completion")
EOF

