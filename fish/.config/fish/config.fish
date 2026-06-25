if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path $HOME/.cargo/binf

# Created by `pipx` on 2026-05-19 06:43:08
set PATH $PATH /home/waweru/.local/bin

# Disable greeting
set -g fish_greeting

# Editor
set -gx EDITOR nvim

# History settings
set -U fish_history 10000

# Prompt spacing
set -g fish_prompt_pwd_dir_length 3

# Better PATH
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# Vi mode
fish_vi_key_bindings

# Starship prompt
starship init fish | source
# FZF keybindings
fzf --fish | source

# Better ls using eza
alias ls="eza --icons"
alias ll="eza -lah --icons --group-directories-first"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Better cat
alias cat="batcat"

# Safer commands
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias mkdir="mkdir -p"
alias free="free -h"
alias df="df -h"

abbr keyd 'keyd.rvaiya'


# Git shortcuts
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am "did stuff"'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push origin main'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'
    abbr gcl 'git clone --depth=1'

abbr -a paru 'paru -S --needed'

# neovim 
abbr nv 'nvim'

# Colored man pages
set -gx LESS_TERMCAP_mb (printf "\e[1;32m")
set -gx LESS_TERMCAP_md (printf "\e[1;32m")
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_so (printf "\e[01;33m")
set -gx LESS_TERMCAP_ue (printf "\e[0m")
set -gx LESS_TERMCAP_us (printf "\e[1;4;31m")




# Other 

alias ports="ss -tulpen"
alias myip="curl ifconfig.me"
alias ducks="du -sh * | sort -h"
alias duf="duf"
alias top="btop"
alias du="du -h --max-depth=1"
alias duall="du -ah"

