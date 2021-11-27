# @uday-sudo's neovim config

I dunno what more information u want but it iz what it iz.

LSP Config
Shortcuts for all Plugins that need them
Nvim peekup shortcuts
Fterm shortcuts
Filetree(nvim-tree)x

Keybinds to remember:

:TransparentToggle                to Toggle transparency
Alt+i                             To toggle Fterm
:MarkdownPreviewToggle            To Toggle markdown Preview
F5                                To write Latex Formulas
""                                To Open Register Peekup

lsp keybinds:
    gD          Goto declaration
    gd          Goto Definition
    space+ca    Code Action
    [d          Prev Diagnostic
    ]d          Next Diagnostic

Telescope Keybinds:
    ;           List Buffers
    Control-d   Kill Highlighted Buffers
    leader+pp   Open Telescope features
    Leader+m    Recent files
    Leader+/    Find in current buffer
    Leader+'    Open Bookmaks
    Leader+f    Git files
    Leader+bf   Find files
    Leader+rg   Live Grep
    Leader+cs   Colorschemes

Some Usefull Keybinds and commands:
Ctrl+w  h,j,k,l   To move focus around
Ctrl+f  To resize panes
leader+w  to save
leader+wg to save and quit
leader+q to quit
Leader+t for Nvim-Tree
Leader+[,]   to move around buffers


Nvim-Tree Keybinds: (open using leader+t)
    <CR> or o on .. will cd in the above directory
    <C-]> will cd in the directory under the cursor
    <BS> will close current opened directory or parent
    a to add a file. Adding a directory requires leaving a leading / at the end of the path.
    r to rename a file
    <C-r> to rename a file and omit the filename on input
    x to add/remove file/directory to cut clipboard
    c to add/remove file/directory to copy clipboard
    y will copy name to system clipboard
    Y will copy relative path to system clipboard
    gy will copy absolute path to system clipboard
    p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
    d to delete a file (will prompt for confirmation)
    ]c to go to next git item
    [c to go to prev git item
    - to navigate up to the parent directory of the current file/directory
    s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
    if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
    if the file is a symlink, <CR> will follow the symlink (if the target is a file)
    <C-v> will open the file in a vertical split
    <C-x> will open the file in a horizontal split
    <C-t> will open the file in a new tab
    <Tab> will open the file as a preview (keeps the cursor in the tree)
    I will toggle visibility of hidden folders / files
    H will toggle visibility of dotfiles (files/folders starting with a .)
    R will refresh the tree
    Double left click acts like <CR>
    Double right click acts like <C-]>
