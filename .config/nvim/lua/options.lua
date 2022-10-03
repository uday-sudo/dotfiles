vim.cmd([[colorscheme onedark]])
vim.cmd([[let g:transparent_enabled = v:false]]) --transparent toggle


local api = vim.api

-- Highlight on yank
local TermGrp = api.nvim_create_augroup("TermOpen", { clear = true })
api.nvim_create_autocmd("TermOpen", {
  command = "silent! setlocal nonu",
  group = TermGrp,
})

-- Enable undo features, even after closing vim
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.cache/nvim'
vim.o.undolevels = 2000

-- Options
vim.o.history=150
vim.o.termguicolors=true
vim.o.scrolloff=10
vim.o.backspace='indent,eol,start'
vim.o.cmdheight=1
vim.o.hidden = true

-- Move swapfiles and backupfiles to ~/.cache
vim.o.directory = os.getenv('HOME') .. '/.cache/nvim'
vim.o.backup = true
vim.o.backupdir = os.getenv('HOME') .. '/.cache/nvim'

-- Options
vim.o.syntax='on'
vim.o.mouse='a'

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

-- =============================================================================
-- = Keybindings =
-- =============================================================================
vim.g.mapleader = '\\'

-- Simple function to map keymap, non-recursive way
local function map_key(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Unbind default bindings for arrow keys, trust me this is for your own good
--map_key('v', '<up>', '<nop>')
--map_key('v', '<down>', '<nop>')
--map_key('v', '<left>', '<nop>')
--map_key('v', '<right>', '<nop>')
--map_key('i', '<up>', '<nop>')
--map_key('i', '<down>', '<nop>')
--map_key('i', '<left>', '<nop>')
--map_key('i', '<right>', '<nop>')

-- Maping to move in Insert Mode
map_key('i', '<C-h>', '<left>')
map_key('i', '<C-j>', '<down>')
map_key('i', '<C-k>', '<up>')
map_key('i', '<C-l>', '<right>')

-- Some common shortcut
map_key('i', '<Space>fw', '<cmd>w<CR>')

-- Map Esc, to perform quick switching between Normal and Insert mode
map_key('i', 'jk', '<ESC>')

-- Toggleterm Keymaps
map_key('n', '<Space>ot', ':ToggleTerm size=15 direction=horizontal<CR>')
map_key('t', '<C-t>', '<C-\\><C-n><cmd>ToggleTerm size=15 direction=horizontal<CR>')

--Just a general Terminal keybind
map_key('t', '<Esc>', '<c-\\><c-n>')
map_key('t', '<C-[>', '<c-\\><c-n>')
map_key('t', 'jk', '<c-\\><c-n>')

-- restore the session for the current directory
map_key("n", "<Space>qs", [[<cmd>lua require("persistence").load()<cr>]])-- restore the session for the current directory
map_key("n", "<Space>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]])-- restore the last session
map_key("n", "<Space>qd", [[<cmd>lua require("persistence").stop()<cr>]])-- stop Persistence => session won't be saved on exit

-- Telescope Bindings
map_key('n', '<Space>t?', ":lua require'telescope.builtin'.builtin{}<CR>")  --Telescope bindings
map_key('n', '<Space>fr', ":lua require'telescope.builtin'.oldfiles{}<CR>")  --Recent files
map_key('n', '<Space>.', ":lua require'telescope.builtin'.buffers{}<CR>")  --Find buffer Ctrl-D to delete buffer
map_key('n', '<Space>/', ":lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")  --Find in current Buffer
--map_key('n', '<Space>bm', ":lua require'telescope.builtin'.marks{}<CR>")  --Bookmarks
map_key('n', '<Space>tg', ":lua require'telescope.builtin'.git_files{}<CR>")  --git files
map_key('n', '<Space>ff', ":lua require'telescope.builtin'.find_files{}<CR>")  --all files
map_key('n', '<Space>rg', ":lua require'telescope.builtin'.live_grep{}<CR>")  --ripgrep like grep through dir
map_key('n', '<Space>tc', ":lua require'telescope.builtin'.colorscheme{}<CR>")  --pick colorscheme

--Buffer and Pane Management, General Use
map_key('n', '<Space>bd', "<cmd>bdelete<CR>")
map_key('n', '<Space>[', "<cmd>bprevious<CR>")
map_key('n', '<Space>]', "<cmd>bnext<CR>")
map_key('n', '<M-h>', "<C-w>h<CR>")
map_key('n', '<M-j>', "<C-w>j<CR>")
map_key('n', '<M-k>', "<C-w>k<CR>")
map_key('n', '<M-l>', "<C-w>l<CR>")

map_key('n', '<Space>sv', "<cmd>vsplit<CR>")
map_key('n', '<Space>sh', "<cmd>split<CR>")

--FileExplorer Keybinds (g? in tree for all keybinds)
map_key('n', '<Space>tt', "<cmd>NvimTreeToggle<CR>")
map_key('n', '<Space>tf', "<cmd>NvimTreeFindFile<CR>")

-- Hop Word
map_key('n', '<Space>fw', "<cmd>HopWord<CR>")


--[[
  Alt-x   -> Toggle Lsp signature

  "       -> Open Registers Menu(normal or visual mode)
  Ctrl-R  -> Open Registers in insert mode

  Alt-i   -> Toggle Floating terminal
  SPC o t -> Toggle term(normal mode)
  Ctrl-t  -> Toggle term(insert mode, terminal mode)


--]]

