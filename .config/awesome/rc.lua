
--[[
 ___  ___  ________  ________      ___    ___  _____  ________    _____         
|\  \|\  \|\   ___ \|\   __  \    |\  \  /  /|/ __  \|\   __  \  / __  \        
\ \  \\\  \ \  \_|\ \ \  \|\  \   \ \  \/  / /\/_|\  \ \  \|\  \|\/_|\  \       
 \ \  \\\  \ \  \ \\ \ \   __  \   \ \    / /\|/ \ \  \ \  \\\  \|/ \ \  \      
  \ \  \\\  \ \  \_\\ \ \  \ \  \   \/  /  /      \ \  \ \  \\\  \   \ \  \     
   \ \_______\ \_______\ \__\ \__\__/  / /         \ \__\ \_______\   \ \__\    
    \|_______|\|_______|\|__|\|__|\___/ /           \|__|\|_______|    \|__|    
                                 \|___|/

    The config i wrote to use awesome wm, it is terrible and not recommended
    for anyone to use.
--]]

pcall(require, "luarocks.loader")
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")


local gears = require("gears")                -- Standard awesome library
local awful = require("awful")
require("awful.autofocus")

local wibox = require("wibox")                -- Widget and layout library
        
local beautiful = require("beautiful")        -- This makes things look cool
        
--local naughty = require("naughty")            -- this is what handles the themes
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")           -- This shows the VIM keybinds in help section

--====================================================================================================


--====================================================================================================
--====================================================================================================
-- {{{ Variable definitions
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme1/theme.lua")
terminal = "kitty"--"xfce4-terminal"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4" --Mod4 is the super key and Mod1 is the alt key

--Colors for Panel here
boxbg = "#c2c5c3"
text = "#252729"
background = "#2f343f"
background_alt = "#444"
primary = "#ffb52a"
alert = "#bd2c40"

--====================================================================================================
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.floating,
--  awful.layout.suit.tile.top,
--  awful.layout.suit.tile.left,
--  awful.layout.suit.spiral.dwindle,
--  awful.layout.suit.fair,
--  awful.layout.suit.spiral,
--  awful.layout.suit.tile.bottom,
--  awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

--====================================================================================================
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

menubar.utils.terminal = terminal -- Set the terminal for applications that require it

--====================================================================================================


-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )
--====================================================================================================
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    --awful.tag({ "", "", "", "", "", "", "", "磊", "ﭮ" }, s, awful.layout.layouts[1])



-- Create a textclock widget [format = "   %b %_d %Y  %H:%M ",]
mytextclock1 = wibox.widget {
      format = "%b %d %Y - ",
      widget = wibox.widget.textclock,
}
mytextclock2 = wibox.widget {
      format = "%H:%M",
      widget = wibox.widget.textclock,
}

--month_calendar = awful.widget.calendar_popup.month()
--month_calendar:attach( mytextclock2, "tr" )
--month_calendar:toggle() to make the popup appear
-- Create a textclock widget
local cw = calendar_widget()
-- or customized
local cw = calendar_widget({
    theme = 'nord',
    placement = 'top_right',
    start_sunday = false,
    radius = 12,
-- with customized next/previous (see table above)
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock1:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)



--Systray here
mysystray = wibox.widget {
      base_size = 25,
      opacity = 1,
      widget = wibox.widget.systray(),
}

--My Separator
separate =  {
                {
                wibox.widget{ text = " | ", align  = "center", valign = "top", font = "SauceCodePro Nerd Font Mono Regular 10", widget = wibox.widget.textbox},
                --bg = "#263238",
                --fg = "#40424D",
                widget = wibox.container.background,
                },
                top = 1,
                widget = wibox.container.margin,
            }


--my battery widget
battery = batteryarc_widget({
            show_current_level = true,
            arc_thickness = 0,
            size = 28,
            font = "SauceCodePro Nerd Font Mono Bold 12",

          })

-- Separator for right side
--rs = wibox.widget{ text = " ", align  = "right", valign = "center", font = "SauceCodePro Nerd Font Mono Regular 20", widget = wibox.widget.textbox}


    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 25 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            separate,
            s.mytaglist,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            separate,--5c88ac
            {
              brightness_widget{
                type = 'icon_and_text',
                program = 'brightnessctl',
                step = 2,
                base = 36,
                font = "SauceCodePro Nerd Font Mono Bold 13"
                },
              fg = "#bb6870",
              widget = wibox.container.background
            },
            separate,
            {
              wibox.widget{ text = "", align  = "center", valign = "center", font = "Iosevka Regular 13", widget = wibox.widget.textbox},
              fg = "#d1ab6f",
              widget = wibox.container.background,
            },
            {
              net_speed_widget,
              fg = "#d1ab6f",
              widget = wibox.container.background
            },
            separate,
            {
              wibox.widget{ text = " ", align  = "center", valign = "center", font = "Iosevka Regular 13", widget = wibox.widget.textbox},
              fg = "#9fc463",
              widget = wibox.container.background,
            },
            {
              battery,
              fg = "#9fc463",
              widget = wibox.container.background
            },
            separate,
            {
              volume_widget,
              fg = "#a683ba",
              widget = wibox.container.background
            },
            separate,
            {
              wibox.widget{ text = " ", align  = "center", valign = "center", font = "Iosevka Regular 13", widget = wibox.widget.textbox},
              fg = "#53d1ec",
              widget = wibox.container.background,
            },
            {
              mytextclock1,
              fg     = '#53d1ec',
              widget = wibox.container.background
            },
            {
              wibox.widget{ text = " ", align  = "center", valign = "center", font = "Iosevka Regular 13", widget = wibox.widget.textbox},
              fg = "#53d1ec",
              widget = wibox.container.background,
            },
            {
              mytextclock2,
              fg     = '#53d1ec',
              widget = wibox.container.background
            },
            separate,
            mysystray,
            separate,
            {
              s.mylayoutbox,
              bg = "#263238",
              widget = wibox.container.background,
            },
        },
    }
end)
-- }}}

--====================================================================================================
--====================================================================================================
-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "q",function() awful.spawn("/home/uday/.config/rofi/powermenu/powermenu.sh")  end,
              {description="PowerMenu", group="awesome"}),
    awful.key({ modkey,           }, "d",function() awful.spawn("/home/uday/.config/rofi/launchers/colorful/launcher.sh")  end,
              {description="Rofi Applauncher", group="awesome"}),
    awful.key({ modkey,           }, "a",function() awful.spawn("/home/uday/.config/rofi/launchers/text2/launcher.sh")  end,
              {description="Rofi Windowcd", group="awesome"}),
    awful.key({}, "XF86AudioMute",function() awful.spawn("amixer set Master toggle")  end,
              {description="Mute", group="awesome"}),
    awful.key({}, "XF86AudioRaiseVolume",function() awful.spawn("amixer set Master 5%+ unmute")  end,
              {description="Volume up", group="awesome"}),
    awful.key({}, "XF86AudioLowerVolume",function() awful.spawn("amixer set Master 5%- unmute")  end,
              {description="Volume Down", group="awesome"}),
    awful.key({}, "Print",function() awful.spawn("xfce4-screenshooter -c -r")  end,
              {description="Screenshot to clipboard", group="awesome"}),
    awful.key({ modkey,   }, "Print",function() awful.spawn("xfce4-screenshooter")  end,
              {description="screenshooter", group="awesome"}),
    awful.key({modkey, "Control"}, "l",function() awful.titlebar.toggle(client.focus) end,
              {description="Toggle focused titlebar", group="awesome"}),





    awful.key({ modkey, "Control" }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,"Shift"    }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey,           }, "q", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Control"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "o",     function () awful.spawn("dmenu_run") end,
              {description = "run dmenu", group = "launcher"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "w",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

--====================================================================================================
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

--====================================================================================================
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

--====================================================================================================
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).

awful.rules.rules = {
    size_hints_honor = false,
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = false }
    },
}
--====================================================================================================
-- {{{ Signals
-- Signal function to execute when a new client appears.
screen.connect_signal("arrange", function (s)
    local max = s.selected_tag.layout.name == "max"
    local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count
    -- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
    for _, c in pairs(s.clients) do
        if (max or only_one) and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

--====================================================================================================
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

--Autostart script
awful.spawn.with_shell("$HOME/.config/awesome/startup.sh")
