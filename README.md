# Dotfiles

This repository consists of my dotfiles for the following linux tools:
- Alacritty
- Dunst
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
sudo pacman -S stow alacritty dunst kitty i3 fastfetch neovim picom polybar tmux git zsh-syntax-highlighting zsh-autosuggestions zsh-completions
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
./stow.sh
```

In case the executable file does not run, try these command:

```
chmod +x stow.sh
stow.sh
```

`chmod +x` makes a shell script executable. So, it is safe to run the command.

Now, you should have the necessary config files in the `~/.config/` directory.
