"init.vim

lua <<EOF
require('plugins')
require('lsp_list')
require('lspconf')
require('aerialconf') 
require('autocomplete')
require('snippy')
require('TSconf')
require('FlotTerm')
require('telescoping')
require('shady')
require("BarAndTab")
require('DiscordFlex')

EOF

"sourcing
source $HOME/.config/nvim/config/nvimconfig.vim
source $HOME/.config/nvim/config/bars.vim
source $HOME/.config/nvim/config/luatree.vim



