--lualine settings from here

-- themes are here=> https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    --section_separators = {left = '', right = ''},
    --component_separators = {left = '', right = ''},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


--[[

Available themes:
16color, ayu_dark, ayu_light, ayu_mirage, codedark, dracula, 
everforest, gruvbox, gruvbox_light, gruvbox_material, horizon, 
iceberg_dark, iceberg_light, jellybeans, material, modus_vivendi, 
molokai, nightfly, nord, oceanicnext, onedark, onelight, palenight, 
papercolor_dark, papercolor_light, powerline, seoul256, 
solarized_dark, solarized_light, tomorrow, wombat

--]]
