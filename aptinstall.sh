Script modified. Pacman check removed. Apt tools merged. Absolute paths enforced.

```bash
#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting Desktop Environment..."
DE="${XDG_CURRENT_DESKTOP:-}"

if [ ! -f /etc/debian_version ]; then
    echo "[-] Unsupported Linux distribution. Apt required. Exiting." >&2
    exit 1
fi

# ==========================================
# 1. INSTALL CORE PACKAGES AND DEPENDENCIES
# ==========================================
echo "==> Installing base software, runtimes, and compiler toolchains via Apt..."

sudo apt-get update -y
sudo apt-get install -y \
    kitty fish \
    build-essential cmake unzip ninja-build gettext curl git \
    nodejs npm pipx \
    wl-clipboard xclip ripgrep findutils fzf stow xkb-data x11-xkb-utils libxkbcommon-tools \
    btop bat plocate rofi ulauncher \
    unrar-free p7zip-full \
    trash-cli okular fonts-jetbrains-mono \
    vlc klavaro wget

# Ensure pipx execution path binaries register correctly
/usr/bin/pipx ensurepath

# ==========================================
# 2. BUILD NEOVIM 0.12 FROM SOURCE
# ==========================================
echo "==> Building Neovim 0.12 from source release tag..."
SRC_DIR=$(mktemp -d)
/usr/bin/git clone --depth 1 --branch v0.12.1 https://github.com/neovim/neovim.git "$SRC_DIR"

cd "$SRC_DIR"
/usr/bin/make CMAKE_BUILD_TYPE=Release
sudo /usr/bin/make install

cd "$HOME"
rm -rf "$SRC_DIR"

# ==========================================
# 3. EXTRA RUNTIMES AND LANGUAGE SERVERS
# ==========================================
echo "==> Installing Rust, Cargo tools, Python packages, and NPM globals..."

# Install Rust
/usr/bin/curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | /usr/bin/sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"

# Install Language Servers and Tooling
"$HOME/.cargo/bin/cargo" install marksman asm-lsp
/usr/bin/pipx install yt-dlp black
sudo /usr/bin/npm install -g tree-sitter-cli pyright

# ==========================================
# 4. EXTERNAL DEB PACKAGES (XDM & CHROME)
# ==========================================
echo "==> Fetching external .deb packages..."
DOWNLOADS_DIR="$HOME/Downloads"
/usr/bin/mkdir -p "$DOWNLOADS_DIR"

# Download and Install XDM (.NET version)
/usr/bin/curl -L "https://github.com/subhra74/xdm/releases/download/8.0.25/xdman_gtk_8.0.25_amd64.deb" -o "$DOWNLOADS_DIR/xdman_gtk_8.0.25_amd64.deb"
sudo apt-get install -y "$DOWNLOADS_DIR/xdman_gtk_8.0.25_amd64.deb"

# Download and Install Chrome
/usr/bin/wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O "$DOWNLOADS_DIR/google-chrome-stable_current_amd64.deb"
sudo apt-get install -y "$DOWNLOADS_DIR/google-chrome-stable_current_amd64.deb"

# ==========================================
# 5. THEME CONFIGURATION
# ==========================================
echo "==> Downloading Tokyo Night Kitty theme..."
/usr/bin/mkdir -p "$HOME/.config/kitty/themes"
/usr/bin/curl -L https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/master/tokyo-night-kitty.conf \
    -o "$HOME/.config/kitty/themes/tokyo-night.conf"

# ==========================================
# 6. INTERACTIVE SHELL ENVIRONMENT MIGRATION
# ==========================================
FISH_PATH="/usr/bin/fish"
if [ "${SHELL}" != "$FISH_PATH" ]; then
    echo "==> Changing default shell environment to Fish..."
    sudo /usr/bin/chsh -s "$FISH_PATH" "$USER"
fi

# Configure Fish path for future sessions
if [ -d "$HOME/.config/fish" ]; then
    /usr/bin/mkdir -p "$HOME/.config/fish"
    echo "fish_add_path \$HOME/.cargo/bin" >> "$HOME/.config/fish/config.fish"
fi

# ==========================================
# 7. ENVIRONMENT INPUT & KEYBOARD CONFIGURATION
# ==========================================
echo "==> Configuring input sources and key overrides..."

if [[ "$DE" == *"KDE"* ]]; then
    echo "    Applying configurations for KDE Plasma Engine..."
    /usr/bin/mkdir -p "$HOME/.config"
    /usr/bin/kwriteconfig6 --file "$HOME/.config/kxkbrc" --group "Layout" --key "LayoutList" "us,real-prog-dvorak"
    /usr/bin/kwriteconfig6 --file "$HOME/.config/kxkbrc" --group "Layout" --key "Use" "true"
    /usr/bin/kwriteconfig6 --file "$HOME/.config/kxkbrc" --group "Layout" --key "Options" "caps:swapescape"
    /usr/bin/qdbus6 org.kde.keyboard /Layouts reconfigure || true
else
    echo "    Applying configurations for GNOME/XFCE..."
    /usr/bin/gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'real-prog-dvorak')]"
    /usr/bin/gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
fi

# ==========================================
# 8. AUTOMATIC DOTFILES SYMLINK STOWING
# ==========================================
echo "==> Preparing system profile paths for GNU Stow orchestration..."

rm -rf "$HOME/.config/xkb"

if [ -d "$HOME/dotfiles" ]; then
    cd "$HOME/dotfiles"
    /usr/bin/stow xkb
    echo "[+] Symlinks successfully generated for xkb module."
else
    echo "[-] WARNING: ~/dotfiles directory not detected. Skipping automatic Stow execution step." >&2
fi

echo "[!] SUCCESS: Configuration complete. Restart session to cycle terminal shell environments."

```
