#The config starts from here
r'''
___  ___  ________  ________      ___    ___  _____  ________    _____         
|\  \|\  \|\   ___ \|\   __  \    |\  \  /  /|/ __  \|\   __  \  / __  \        
\ \  \\\  \ \  \_|\ \ \  \|\  \   \ \  \/  / /\/_|\  \ \  \|\  \|\/_|\  \       
 \ \  \\\  \ \  \ \\ \ \   __  \   \ \    / /\|/ \ \  \ \  \\\  \|/ \ \  \      
  \ \  \\\  \ \  \_\\ \ \  \ \  \   \/  /  /      \ \  \ \  \\\  \   \ \  \     
   \ \_______\ \_______\ \__\ \__\__/  / /         \ \__\ \_______\   \ \__\    
    \|_______|\|_______|\|__|\|__|\___/ /           \|__|\|_______|    \|__|    
                                 \|___|/                                     
'''
#Custom Imports=========================================================

import os
import subprocess 
import re
import socket
from libqtile import hook
from libqtile.command import lazy

#Default Imports=========================================================

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

#Imports ended====================================================================

mod = "mod4"
terminal = "xfce4-terminal"
browser = "firefox"
FocusColor = '#bb7e0d'
UnfocusColor = '#575757'

#Keybinds====================================================================
keys = [
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    #Essentials
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "mod1"], "Return", lazy.spawn(terminal + " -e bpytop"), desc="Launch Byptop"),
    Key([mod], "q", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "q", lazy.spawn("/home/uday/.config/rofi/powermenu/powermenu.sh"), desc="Powermenu Shortcut"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    #Run Prompts
    Key([mod], "d", lazy.spawn("/home/uday/.config/rofi/launchers/misc/launcher.sh"), desc="Applauncher"),
    Key([mod, "shift"], "b", lazy.spawn(browser), desc="Launch Browser"),
    Key([mod], "o", lazy.spawn("dmenu_run"), desc="Run demu"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),


    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key(["mod1"], "Tab", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "shift"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    #Special keys
    Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle"), desc="Mute Volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%- unmute"), desc="Lower Volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+ unmute"), desc="Raise Volume"),
    Key([], "Print", lazy.spawn("xfce4-screenshooter -c -r"), desc="Screnshot"),
    Key([mod], "Print", lazy.spawn("xfce4-screenshooter"), desc="Screenshot"),

    #Actions
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='toggle floating'),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


#GROUPS===========================================================================================================
group_names = [("1", {'layout': 'MonadTall'}),
               ("2", {'layout': 'MonadTall'}),
               ("3", {'layout': 'MonadTall'}),
               ("4", {'layout': 'MonadTall'}),
               ("5", {'layout': 'MonadTall'}),
               ("6", {'layout': 'MonadTall'}),
               ("7", {'layout': 'MonadTall'}),
               ("8", {'layout': 'MonadTall'}),
               ("9", {'layout': 'MonadTall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group


#LAYOUTS+=========================================================================================================
layouts = [
    #layout.VerticalTile(),
    #layout.Zoomy(),
    #layout.Columns(),
    #layout.Stack(num_stacks=2),
    #layout.Bsp(),
    #layout.Matrix(),
    #layout.Tile(),
    #layout.MonadWide(),
    layout.MonadTall(
        border_focus = FocusColor,
        border_normal = UnfocusColor,
        border_width = 3,
        margin = 10,
        single_margin = 10,
        ratio = 0.55),
    layout.Max(),
    layout.RatioTile(
        border_focus = FocusColor,
        border_normal = UnfocusColor,
        border_width = 3,
        margin = 10),
    layout.TreeTab(
         font = "Ubuntu",
         fontsize = 10,
         sections = ["FIRST", "SECOND"],
         section_fontsize = 10,
         border_width = 2,
         bg_color = "1c1f24",
         active_bg = "c678dd",
         active_fg = "000000",
         inactive_bg = "a9a1e1",
         inactive_fg = "1c1f24",
         padding_left = 0,
         padding_x = 0,
         padding_y = 5,
         section_top = 10,
         section_bottom = 20,
         level_shift = 8,
         vspace = 3,
         panel_width = 100
         ),
    layout.Floating(
        border_focus = FocusColor,
        border_normal = UnfocusColor,
        border_width = 3,
        margin = 10)

]

#WIDGETS I.E BAR======================================================================================

colors = [["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens

widget_defaults = dict(
    font='DejaVuSansMono Nerd Font',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    inactive = '#5d7499',
                    borderwidth = 2,
                    rounded = False,
                    highlight_color = colors[1],
                    this_current_screen_border = colors[6],
                    this_screen_border = colors [4],
                    other_current_screen_border = colors[6],
                    other_screen_border = colors[4],
                    foreground = colors[2],
                    background = "#1b4c7d",
                    padding = 4,
                    fontsize = 15),
                widget.CurrentLayout(
                    padding = 10),
                widget.Prompt(),
                widget.WindowName(
                    background = '#1b4c7d'),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(
                    padding = 5),
                widget.Clock(
                    format='   %b %_d %Y  %H:%M ',
                    foreground = '#ee9a00'),
            ],
            24,
            background = '#282c34',
            margin = 0
        ),
    ),
]

#SOME EXTRA RULES========================================================================================
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

#STARTUP HOOK=============================================================================
@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.call([home])

#JUST KEEP THIS HERE AND NOBODY DIES======================================================
wmname = "LG3D"
