
sudo pacman -Syu --needed --noconfirm \
        kitty fish neovim \
        base-devel cmake unzip ninja curl git \
        nodejs npm python-pipx rustup \
        wl-clipboard xclip ripgrep fd fzf stow \
        btop bat plocate stow rofi ulauncher \
        unzip unrar-free p7zip-full \
        trash-cli okular fonts-jetbrains-mono \
        vlc klavaro stow \

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh        
fish_add_path $HOME/.cargo/binf
cargo install marksman asm-lsp 
pipx install yt-dlp black 
sudo npm install -g tree-sitter-cli pyright

# download xdm from github(.net version not default) into downnloads folder then
sudo apt install ./xdman_gtk_8.0.25_amd64.deb

#kitty theme download
curl -L https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/master/tokyo-night-kitty.conf \
                        -o ~/.config/kitty/themes/tokyo-night.conf

#chrome only for cachyos
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
