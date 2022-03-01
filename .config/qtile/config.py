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
from libqtile import hook
from libqtile.command import lazy

#Default Imports=========================================================

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

#Imports ended====================================================================

mod = "mod4"
terminal = "kitty"
browser = "firefox"
FocusColor = '#ff4343'  #'#bb7e0d'
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
    layout.Columns(
        border_focus = FocusColor,
        border_normal = UnfocusColor,
        border_width = 3,
        margin = 3,
        single_margin = 10,
        ratio = 0.55),
    #layout.Stack(num_stacks=2),
    #layout.Bsp(),
    layout.Matrix(
        columns = 3,
        border_focus = FocusColor,
        border_normal = UnfocusColor,
        border_width = 3,
        margin = 10),
    #layout.Tile(),
    #layout.MonadWide(),
    #layout.MonadTall(),
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

colors1 = [["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]] # backbround for inactive screens

# colors for the bar/widgets/panel
def init_colors():
    return [["#282a36", "#282a36"], # color 0 | bg
            ["#282a36", "#282a36"], # color 1 | bg
            ["#f8f8f2", "#f8f8f2"], # color 2 | fg
            ["#ff5555", "#ff5555"], # color 3 | red
            ["#50fa7b", "#50fa7b"], # color 4 | green
            ["#f1fa8c", "#f1fa8c"], # color 5 | yellow
            ["#bd93f9", "#bd93f9"], # color 6 | blue
            ["#ff79c6", "#ff79c6"], # color 7 | magenta
            ["#8be9fd", "#8be9fd"], # color 8 | cyan
            ["#bbbbbb", "#bbbbbb"]] # color 9 | white

def init_separator():
    return widget.Sep(
                size_percent = 60,
                margin = 5,
                linewidth = 2,
                background = colors[1],
                foreground = "#555555")

def nerd_icon(nerdfont_icon, fg_color):
    return widget.TextBox(
                font = "Iosevka Nerd Font",
                fontsize = 15,
                text = nerdfont_icon,
                foreground = fg_color,
                background = colors[1])

def init_edge_spacer():
    return widget.Spacer(
                length = 5,
                background = colors[1])


colors = init_colors()
sep = init_separator()
space = init_edge_spacer()


widget_defaults = dict(
    font='Source Code Pro Medium',
    fontsize=15,
    padding=5,
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
            # Left Side of the bar

            space,
            #widget.Image(
            #    filename = "/usr/share/pixmaps/archlinux-logo.png",
            #    background = colors[1],
            #    margin = 3
            #),
            widget.Image(
                filename = "~/.config/qtile/python.png",
                background = colors[1],
                margin = 3,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(
                        'dmenu_run'
                    ),
                    'Button3': lambda : qtile.cmd_spawn(
                        f'{terminal} -e vim {home_dir}/.config/qtile/config.py'
                    )
                }
            ),
            widget.GroupBox(
                font = "Iosevka Nerd Font",
                fontsize = 15,
                foreground = colors[2],
                background = colors[1],
                borderwidth = 4,
                highlight_method = "text",
                this_current_screen_border = colors[6],
                active = colors[4],
                inactive = colors[2]
            ),
            sep,
            nerd_icon(
                "  ",
                colors[6]
            ),
            widget.Battery(
                foreground = colors[2],
                background = colors[1],
                format = "{percent:2.0%}"
            ),
            nerd_icon(
                "墳",
                colors[3]
            ),
            widget.Volume(
                foreground = colors[2],
                background = colors[1]
            ),
            widget.Spacer(
                length = bar.STRETCH,
                background = colors[1]
            ),

            # Center bar

            nerd_icon(
                "",
                colors[7]
            ),
            widget.CurrentLayout(
                foreground = colors[2],
                background = colors[1]
            ),
            sep,
            nerd_icon(
                "﬙",
                colors[3]
            ),
            widget.CPU(
                format = "{load_percent}%",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            nerd_icon(
                "",
                colors[4]
            ),
            widget.Memory(
                format = "{MemUsed:.0f}{mm}",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            nerd_icon(
                "",
                colors[6]
            ),
            widget.GenPollText(
                foreground = colors[2],
                background = colors[1],
                update_interval = 5,
                func = lambda: storage.diskspace('FreeSpace'),
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn(f"{terminal} -e gtop")
                }
            ),
            sep,
            nerd_icon(
                "",
                colors[4]
            ),
            widget.GenPollText(
                foreground = colors[2],
                background = colors[1],
                update_interval = 5,
                func = lambda: subprocess.check_output(f"{home_dir}/.config/qtile/scripts/num-installed-pkgs").decode("utf-8")
            ),

            # Left Side of the bar

            widget.Spacer(
                length = bar.STRETCH,
                background = colors[1]
            ),
            nerd_icon(
                "",
                colors[4]
            ),
            widget.Net(
                format = "{down} ↓↑ {up}",
                foreground = colors[2],
                background = colors[1],
                update_interval = 2,
                mouse_callbacks = {
                    'Button1': lambda : qtile.cmd_spawn("def-nmdmenu")
                }
            ),
            sep,
            nerd_icon(
                "",
                colors[7]
            ),
            widget.Clock(
                format = '%b %d-%Y',
                foreground = colors[2],
                background = colors[1]
            ),
            nerd_icon(
                "",
                colors[8]
            ),
            widget.Clock(
                format = '%H:%M %p',
                foreground = colors[2],
                background = colors[1]
            ),
            widget.Systray(
                background = colors[1]
            ),
            space
        ]
    return widgets_list


# screens/bar
def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_list(), size=30, opacity=0.9, margin=[0,0,0,0]))]

screens = init_screens()


'''
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    inactive = '#5d7499',
                    borderwidth = 3,
                    rounded = False,
                    highlight_color = colors1[1],
                    highlight_method = "line",
                    this_current_screen_border = colors1[6],
                    this_screen_border = colors1[4],
                    other_current_screen_border = colors1[6],
                    other_screen_border = colors1[4],
                    foreground = colors1[2],
                    background = "#1b4c7d",
                    padding = 3,
                    fontsize = 15),
                widget.TextBox(
                    #background = "#282c34",
                    foreground = "#a355bc",
                    text = "ﯺ ",
                    fontsize = 18),
                widget.CurrentLayout(
                    padding = 5,
                    foreground = "#a355bc",
                    fontsize = 14),
                widget.Prompt(),
                widget.TextBox(
                    foreground = "#ABABAB",
                    text = "|",),
                widget.TextBox(
                    #background = "#282c34",
                    foreground = "#00f769",
                    text = "﫳",
                    fontsize = 18),
                widget.WindowName(
                    #background = '#1b4c7d',
                    foreground = "#00f769"),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(
                    foreground = "#ABABAB",
                    text = "|",),
                widget.Systray(
                    padding = 5),
                widget.TextBox(
                    foreground = "#ababab",
                    text = "|",),
                widget.TextBox(
                    foreground = '#ff6229',
                    text = '盛',
                    fontsize = 18,
                    padding = 10,
                ),
		        widget.Backlight(
                    foreground = '#ff6229',
                    backlight_name = 'backlight',
                    brightness_file = '/sys/class/backlight/intel_backlight/brightness',
                    max_brightness_file = '/sys/class/backlight/intel_backlight/max_brightness',
                    fontsize = 15,
                ),
                widget.TextBox(
                    foreground = "#ABABAB",
                    text = "|",),
                #widget.Net(
                #    #interface = "enp6s0",
                #    format = ' {down}  {up} ',
                #    foreground = "#a509a3",
                #    padding = 5,
                #    fontsize = 14
                #    ),
                widget.Battery(
                    foreground = "#1CD1BA",
                    charge_char = " ",
                    discharge_char = " ",
                    empty_char = " ",
                    full_char = " ",
                    fontsize = 15,
                    format = "{char} {percent:2.0%}",
                    notify_below = 35,
                    update_interval = 15
                    ),
                widget.TextBox(
                    foreground = "#ABABAB",
                    text = "|",),
                widget.Clock(
                    fontsize = 14,
                    format='   %b %_d %Y ',
                    foreground = '#ee9a00'),
                widget.TextBox(
                    foreground = "#ABABAB",
                    text = "|",),
                widget.Clock(
                    fontsize = 14,
                    format=' %H:%M ',
                    foreground = '#2596be'),
            ],
            24,
            background = '#282c34',
            margin = 0
        ),
    ),
]
'''
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
