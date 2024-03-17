#!/usr/bin/env sh

#To symlink my dotfiles, not all but only the ones i am currently needing
mv ~/.zshrc ~/.zshrc.bak
ln -s -t ~/ $(pwd)/.zshrc
mv ~/.zshenv ~/.zshenv.bak
ln -s -t ~/ $(pwd)/.zshenv
mv ~/.tmux.conf ~/.tmux.conf.bak
ln -s -t ~/ $(pwd)/.tmux.conf

ln -s -t ~/.fonts/dotfonts $(pwd)/.fonts/dotfonts

mv ~/.config/ags ~/.config/ags.bak
ln -s -t ~/.config/ $(pwd)/.config/ags

mv ~/.config/kitty ~/.config/kitty.bak
ln -s -t ~/.config/ $(pwd)/.config/kitty

mv ~/.config/nvim ~/.config/nvim.bak
ln -s -t ~/.config/ $(pwd)/.config/nvim

mv ~/.config/rofi ~/.config/rofi.bak
ln -s -t ~/.config/ $(pwd)/.config/rofi

mv ~/.config/zathura ~/.config/zathura.bak
ln -s -t ~/.config/ $(pwd)/.config/zathura

mv ~/.config/zellij ~/.config/zellij.bak
ln -s -t ~/.config/ $(pwd)/.config/zellij

mv ~/.config/starship.toml ~/.config/starship.toml.bak
ln -s -t ~/.config/ $(pwd)/.config/starship.toml
