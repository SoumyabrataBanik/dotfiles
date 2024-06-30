# Dotfiles

This repository consists of my dotfiles for the following linux tools:
- Hyprland
- Waybar
- Wlogout
- Rofi
- Alacritty
- Kitty
- i3-wm
- Fastfetch
- Neovim
- Picom
- Polybar
- Tmux
- ZSH shell


## Procedure to use this repo:

If you want to use these config files, make sure you have the following tools installed. If you are using Arch Linux, then just enter the below command in your favorite terminal

```
sudo pacman -S git stow hyprland rofi waybar wlogout alacritty kitty i3 fastfetch neovim picom polybar tmux zsh-syntax-highlighting zsh-autosuggestions zsh-completions
```

Install ZSH from their site [https://ohmyz.sh](https://ohmyz.sh/#install)

Then clone this repo:

```
git clone https://github.com/SoumyabrataBanik/dotfiles.git ~/dotfiles
```

There is an executable in the repository named `stow.sh`. It uses GNU Stow to manage the `.config` files.

Continue to the directory using the command:

```
cd ~/dotfiles
```

And then run the executable file.

```
stow .
```

Now, you should have all the config files symlinked in the `~/.config/` directory.
