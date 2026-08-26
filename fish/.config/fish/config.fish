if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add path
fish_add_path $HOME/.cargo/binf
fish_add_path /opt/gradle-8.14.3/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path $JAVA_HOME/bin
set PATH $PATH /home/waweru/.local/bin

# Source
starship init fish | source
fzf --fish | source
zoxide init fish | source

set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk-amd64
set -g fish_greeting
set -gx EDITOR nvim
set -U fish_history 10000
set -g fish_prompt_pwd_dir_length 3
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


# Better ls using eza
alias ls="eza --icons=always"
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

# Other 
alias ports="ss -tulpen"
alias myip="curl ifconfig.me"
alias ducks="du -sh * | sort -h"
alias duf="duf"
alias top="btop"
alias du="du -h --max-depth=1"
alias duall="du -ah"

# Personal 
abbr -a paru 'sudo paru -S --needed'
abbr gh "/opt/ghidra_12.1.2_PUBLIC/./ghidraRun"
abbr keyd 'sudo /usr/bin/keyd.rvaiya reload'
abbr n 'nvim $(fzf)'
alias z="sessionizer"
alias zj="zellij"
