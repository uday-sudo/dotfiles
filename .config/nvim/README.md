## @uday-sudo's neovim config
***

I am going to put some important information for my own self in this document. Personally i took most of help for tmux from [tmux cheatsheet](https://tmuxcheatsheet.com).

### Tmux Keybinds
| Keybind| Description |
| ----------- | ----------- |
| Ctrl-a | Prefix for Tmux |
| Prefix r | Reload tmux config |
|Prefix [ | Open Reading or scrolling mode|
|Prefix v | Vertical Split |
|Prefix h | horizontal split |
| Prefix + Up,Right,Left,Right | Resize panes |
|Prefix c| Create Window |
|Prefix & | Close Current Window |
| Prefix z | Zoom into the pane |
|Prefix x | Close Current Pane |
| Alt - up,down,left,right | To switch window panes |
| Shift - left,right | Switch windows |

***
## Neovim Commands

| Command | Description |
| ----------- | ----------- |
| :TransparentToggle | To toggle transparent neovim |
| :MarkdownPreviewToggle | To open markdown preview in browser |
| :PackerSync | updates and compiles plugins |


> \<Space> is the PREFIX key in neovim

### General Neovim Keybinds

| Keybind | Desciption |
|---------|------------|
| Ctrl + h,j,k,l | Move Around in Insert Mode |
| PREFIX f w | Save File |
| j k | Escape into normal mode from insert or terminal mode |
| PREFIX o t | ToggleTerm Toggle |
|\<Ctrl> + t | ToggleTerm Toggle From inside terminal |
| PREFIX q s | Restore session for current directory |
| PREFIX q l | Restore Last Session |
| PREFIX q d | Quit Persistence Session saving |
| \<Alt> + x | Toggle LSP signature |
| g D | LSP declaration |
| g d | LSP definition |
| " | Register Peekup Menu |
| \<Ctrl> + r | Register peekup in insert mode |
| \<Alt>+i | FloaTerm Toggle |
| PREFIX s v | Split Vertical |
| PREFIX s h | Split Horizontal |
| PREFIX f w | Find Word using Hop |
| PREFIX t t | NvimTree Toggle |
| PREFIX t f | NvimTree Find File |
| PREFIX b d | Buffer Delete |
| PREFIX [ | Previous Buffer |
| PREFIX ] | Next Buffer |
| \<Alt> + h,j,k,l | Move Between Panes |
| PREFIX t ? | Telescope Bindings |
| PREFIX f r | Recent Files |
| PREFIX . | buffers |
| \<Ctrl>+d | Delete buffer in telescope buffer list |
| PREFIX / | Find in Current Buffer |
| PREFIX t g | Git Files |
| PREFIX f f | All Files |
| PREFIX r g | ripgrep like grep through dir |
| PREFIX t c | Colorschemes |
| \<Ctrl>+w +,- | Change height of pane |
| \<Ctrl>+w >,< | Change width of pane |

#### NvimTree Keybinds
- \<CR> or o on .. will cd in the above directory
- \<C-]> will cd in the directory under the cursor
- \<BS> will close current opened directory or parent
- a to add a file. Adding a directory requires leaving a leading / at the end of the path.
- r to rename a file
- \<C-r> to rename a file and omit the filename on input
- x to add/remove file/directory to cut clipboard
- c to add/remove file/directory to copy clipboard
- y will copy name to system clipboard
- Y will copy relative path to system clipboard
- gy will copy absolute path to system clipboard
- p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
- d to delete a file (will prompt for confirmation)
- ]c to go to next git item
- [c to go to prev git item
- \- to navigate up to the parent directory of the current file/directory
- s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
- if the file is a directory, \<CR> will open the directory otherwise it will open the file in the buffer near the tree
- if the file is a symlink, \<CR> will follow the symlink (if the target is a file)
- \<C-v> will open the file in a vertical split
- \<C-x> will open the file in a horizontal split
- \<C-t> will open the file in a new tab
- \<Tab> will open the file as a preview (keeps the cursor in the tree)
- I will toggle visibility of hidden folders / files
- H will toggle visibility of dotfiles (files/folders starting with a .)
- R will refresh the tree
- Double left click acts like \<CR>
- Double right click acts like \<C-]>