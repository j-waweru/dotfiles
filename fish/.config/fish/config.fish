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

# Better PATH
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# Starship prompt
starship init fish | source

# Better ls using eza
alias ls="eza --icons"
alias ll="eza -lah --icons --group-directories-first"
alias la="eza -a --icons"
alias lt="eza --tree --level=2 --icons"

# Better cat
alias cat="batcat"

# Safer commands
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gco="git checkout"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Fastfetch
alias ff="fastfetch"

# Use fd instead of find
alias find="fdfind"

# Zoxide
zoxide init fish | source

# FZF keybindings
fzf --fish | source

# Colored man pages
set -gx LESS_TERMCAP_mb (printf "\e[1;32m")
set -gx LESS_TERMCAP_md (printf "\e[1;32m")
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_so (printf "\e[01;33m")
set -gx LESS_TERMCAP_ue (printf "\e[0m")
set -gx LESS_TERMCAP_us (printf "\e[1;4;31m")

# Vi mode
fish_vi_key_bindings

# History settings
set -U fish_history 10000

# Prompt spacing
set -g fish_prompt_pwd_dir_length 3
