-- Just a theme i stole from somewhere i can't remember

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                    = {}
theme.dir                      = os.getenv("HOME") .. "/.config/awesome/theme1"
theme.font                     = "SauceCodePro Nerd Font Mono Bold 13"--"Hack Nerd Font Mono 10"
theme.fg_normal                = "#fefefe"
theme.fg_focus                 = "#fefefe"
theme.bg_normal                = "#2a2a37"--"#1f1f1f"
theme.bg_focus                 = "#1f1f1f"
theme.fg_urgent                = "#CC9393"
theme.bg_urgent                = "#2A1F1E"

theme.bg_systray               = "#2a2a37"

theme.tasklist_fg_focus        = "#fefefe"
theme.tasklist_bg_focus        = "#1f1f1f"
theme.menu_height              = dpi(16)
theme.menu_width               = dpi(130)
theme.menu_submenu_icon        = theme.dir .. "/icons/submenu.png"
theme.awesome_icon             = theme.dir .."/icons/awesome.png"

theme.border_width = 3
theme.border_normal = '#575757'
theme.border_focus = '#FFA500'
theme.useless_gap = 2
theme.gap_single_client = false

theme.taglist_squares_sel      = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel    = theme.dir .. "/icons/square_unsel.png"
theme.taglist_font             = "SauceCodePro Nerd Font Mono Bold 18"
theme.taglist_fg_focus         = "#a284b3"
theme.taglist_bg_focus         = "#2a2a37"
theme.taglist_fg_empty         = "#67a1c6"
theme.taglist_bg_empty         = "#2a2a37"
theme.taglist_fg_occupied      = "#67a1c6"
theme.taglist_bg_occupied      = "#2a2a37"
--theme.taglist_shape            = gears.shape.square

theme.layout_tile              = theme.dir .. "/icons/tile.png"
theme.layout_tileleft          = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom        = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop           = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv             = theme.dir .. "/icons/fairv.png"
theme.layout_fairh             = theme.dir .. "/icons/fairh.png"
theme.layout_spiral            = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle           = theme.dir .. "/icons/dwindle.png"
theme.layout_max               = theme.dir .. "/icons/max.png"
theme.layout_fullscreen        = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier         = theme.dir .. "/icons/magnifier.png"
theme.layout_floating          = theme.dir .. "/icons/floating.png"
theme.layout_cornernw          = theme.dir .. "/icons/cornernw.png"

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon    = true
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup     = lain.util.markup
local separators = lain.util.separators
local gray       = "#9E9C9A"

return theme
