# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

#ZSH_THEME="awesomepanda"

# Powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

# nvim alias:
alias n="nvim"
alias vim="nvim"
alias vi="nvim"

#tree alias
alias "treeal"="tree -a -L 2"

#python aliases
alias python="python3"

#pacman alias:
alias p="pacman"

#pacman install, update and search aliases:
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias pss="pacman -Ss"
alias pqi="pacman -Qi"
alias pR="sudo pacman -R"

#update and poweroff alias
alias Poweroff="~/Scripts/update-system.sh"

#yay aliases:
alias yi="yay -S"
alias yu="yay -Syu"
alias yss="yay -Ss"
alias yqi="yay -Qi"
alias yR="yay -R"

#bluetooth alias
alias cbl="~/Scripts/connect-bluetooth.sh"
alias dbl="~/Scripts/disconnect-bluetooth.sh"

#alias to update mirror
alias updateMirror="~/Scripts/update_mirrorlist.sh"

# paths:
export PATH="$HOME/.tmuxifier/bin:$PATH"

#evaluate:
eval "$(tmuxifier init -)"

#tmuxifier alias:
alias t="tmuxifier"
alias tes="tmuxifier es"
alias ts="tmuxifier s"
alias tns="tmuxifier ns"
alias tls="tmuxifier ls"

# editor
export EDITOR=nvim

#Brave alias
alias brave="brave --password-store=basic"

source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto' # long list
#alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

fastfetch
