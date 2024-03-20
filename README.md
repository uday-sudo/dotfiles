
# dotfiles

These are just my personal dotfiles, i did not intend for these to be seen by the public. But since you are here, be carefull as stuff might be broken.

### dependencies(More like packages i use list):
- nvim
- btop
- oh my zsh
- starship prompt
- playerctl
- waylock
- Hyprland
- Aylurs GTK Shell [Github](https://github.com/Aylur/ags):
    - dart sass
    - fd
    - brightnessctl
    - swww
    - fzf
    - wl-clipboard
    - grim
    - asusctl
    - supergfxct
    - Fonts (all available in dotfiles)
         - JetBrainsMono nerd font
         - UbuntuMono nerd font
         - Iosevka
- Zellij (tmux alternative) [Site](https://zellij.dev/)
- ... (i give up)

### Note:
`
Hyprland users must change the name of there theme in the appropriate theme.conf file and there cursor theme name in both the hypland.conf and commmon.conf files.
`
### For AGS:
Clone the repo

      git clone --depth=1 https://github.com/uday-sudo/dotfiles.git
      cp -r dotfiles/.config/ags $HOME/.config/ags
Start ags by including the following in your startup config:

      ags
The following widgets can be toggled in ags:
- datemenu
- quicksettings
- powermenu
- lockscreen     (It doesn't work yet)

By using the command:

      ags -t <name of widget here>

Use this command in your keybinds to toggle widgets, such as for Hyprland:

      bind=CTRL SHIFT, Q,  exec, ags -t powermenu

You should set the following values to true in options.js to allow live CSS updation and enable sass compilation (Do this if CSS is not working):

      const options = {
            recompilesass: false,
            monitorcss: false,
            ...
      }


### Zathura dependencies:
      zathura-cb — Comic book support
      zathura-djvu — DjVu support
      zathura-pdf-mupdf — EPUB, PDF and XPS support based on MuPDF
      zathura-ps — PostScript supportA

### Screenshots

<details><summary>
Hyprland
</summary>

![Hyprland screenshot](/screenies/hyprland.png)
</details>
<details><summary>
Rofi
</summary>

![Rofi screenshot](/screenies/rofi.png)
</details>

<details><summary>
Calendar
</summary>

![Calendar screenshot](/screenies/ags_cal.png)
</details>

<details><summary>
Overview 
</summary>

![Overview screenshot](/screenies/ags_overview.png)
</details>

<details><summary>
Powermenu
</summary>

![Powermenu screenshot](/screenies/ags_powermenu.png)
</details>

<details><summary>
Quicksettings
</summary>

![Sidepanel screenshot](/screenies/ags_quicksettings.png)
</details>

<details><summary>
AwesomeWM
</summary>

![AwesomeWM screenshot](/screenies/awesome_default.png)
</details>

<details><summary>
Qtile
</summary>

![Qtile screenshot](/screenies/qtile_new.png)
</details>


### Some Resources for You
- Ags [Wiki](https://aylur.github.io/ags-docs/)
- Aylur's Dotfiles [repo](https://github.com/Aylur/dotfiles)
- Spotify Theming tool [spicetify](https://spicetify.app/)
- Neovim Distribution (I use it, you don't have to) [LazyVim](https://github.com/LazyVim/LazyVim)
- Catpuccin gtk theme [repo](https://github.com/catppuccin/gtk)
- Catpuccin Cursor theme [repo](https://github.com/catppuccin/cursors)
- Papirus Icon theme [repo](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [nerdfonts](https://www.nerdfonts.com/)

