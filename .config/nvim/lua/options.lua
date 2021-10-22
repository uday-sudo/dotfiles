

vim.cmd([[
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
set incsearch
set ignorecase
set smartcase
syntax on
colorscheme onedark
set cmdheight=1


"Personal Key mappings
map <leader>t <ESC>:vs<CR><C-W>w:term<CR>i
map <leader>tg <ESC>:sp<CR><C-W>w:term<CR>i
map <leader>ts <ESC>:vs<CR><C-W>w
map <leader>tq <ESC>:q<CR>
map <leader>] <ESC>:bn<CR>
map <leader>[ <ESC>:bp<CR>
tnoremap <Esc> <C-\><C-n>
let g:transparent_enabled = v:false

"this for vim todo plugin
filetype plugin on  
set nocompatible

"So that VimWiki works with markdown files
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"keymap to toggle markdown preview
map <C-p> <ESC>:MarkdownPreviewToggle<CR>

]])

-- Options
vim.o.syntax='on'
  -- Turns on mouse
vim.o.mouse='a'
  -- Mr. Mapleader
vim.g.mapleader="\\"

  -- Sets numberline
vim.o.number=true

  -- Tab related settings
vim.o.autoindent=true
vim.o.expandtab=true
vim.o.tabstop=4
vim.o.smarttab=true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.shiftround=true

  -- Shows last used command in status line
vim.o.showcmd=true

  -- Use highlighting when doing a search
vim.o.showmatch=true
  -- Highlight while searching
vim.o.hlsearch=true
  -- Ignores capitalisation while searching
vim.o.ignorecase=true
  -- Incremental search that shows partial matches
vim.o.incsearch=true
  -- Automatically switch search to case-sensitive when search query contains an uppercase letter
vim.o.smartcase=true

  -- Always try to show a paragraph’s last line.
vim.opt.display = vim.opt.display + 'lastline'
  -- Use an encoding that supports unicode.
vim.o.encoding='utf-8'

vim.cmd([[

" >> Telescope bindings
nnoremap <Leader>pp :lua require'telescope.builtin'.builtin{}<CR>
nnoremap <Leader>m :lua require'telescope.builtin'.oldfiles{}<CR>        " most recentuly used files
nnoremap ; :lua require'telescope.builtin'.buffers{}<CR>                 " find buffer
nnoremap <Leader>/ :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>  " find in current buffer
nnoremap <Leader>' :lua require'telescope.builtin'.marks{}<CR>           " bookmarks
nnoremap <Leader>f :lua require'telescope.builtin'.git_files{}<CR>       " git files
nnoremap <Leader>bf :lua require'telescope.builtin'.find_files{}<CR>     " all files
nnoremap <Leader>rg :lua require'telescope.builtin'.live_grep{}<CR>      " ripgrep like grep through dir
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>    " pick color scheme

]])

--[[
Extra keybinds:

fterm:  Alt+i to toggle

nvim-lspconfig:  gd, gD, gr, gi, [d, ]d 

telescope: Ctrl + d to delete buffer in <;> buffer menu



--]]
