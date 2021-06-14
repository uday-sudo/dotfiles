"normal commands
set history=150
set encoding=utf-8
set termguicolors
set number 
set noswapfile
set scrolloff=10
set backspace=indent,eol,start
set shiftwidth=4
set tabstop=4
set mouse=a

"more specific ones
set incsearch
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')

"colorchemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'numirias/semshi'

"airline status bar
Plug 'vim-airline/vim-airline'

"Nerd tree
"Plug 'preservim/nerdtree'

"auto pairer
Plug 'jiangmiao/auto-pairs'

"autocomplettion thingies
Plug 'neoclide/coc.nvim' , {'branch':'release'}


call plug#end()

"sourcing
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/semshi.vim
source $HOME/.config/nvim/plug-config/mappings.vim

"Colorscheme
"syntax enable
syntax on
colorscheme onedark

"airline customization
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

set cmdheight=1
