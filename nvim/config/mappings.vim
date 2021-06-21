"Personal Key mappings
map <leader>t <ESC>:vs<CR><C-W>w:term<CR>i
map <leader>g <ESC>:sp<CR><C-W>w:term<CR>i
map <leader>s <ESC>:vs<CR><C-W>w
map <leader>q <ESC>:q<CR>
map <leader>w <ESC><C-W>w
map <leader>] <ESC>:bn<CR>
map <leader>[ <ESC>:bp<CR>
map <leader>= :term<CR>
tnoremap <Esc> <C-\><C-n>


"Fuzzy finder mappings
map <leader>e <ESC>:Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
"nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

" >> Telescope bindings
nnoremap <Leader>pp :lua require'telescope.builtin'.builtin{}<CR>

" most recentuly used files
nnoremap <Leader>m :lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; :lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' :lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f :lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs :lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg :lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs :lua require'telescope.builtin'.colorscheme{}<CR>
