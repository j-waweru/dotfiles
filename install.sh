#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting Package Manager and Desktop Environment..."
DE="${XDG_CURRENT_DESKTOP:-}"

if [ -f /etc/debian_version ]; then
    PM="apt"
    echo "    System identified as Debian-based (Kali/REMnux)."
elif [ -f /etc/arch-release ] || grep -q "cachyos" /etc/os-release 2>/dev/null; then
    PM="pacman"
    echo "    System identified as Arch-based (CachyOS)."
else
    echo "[-] Unsupported Linux distribution. Exiting." >&2
    exit 1
fi

# ==========================================
# 1. INSTALL CORE PACKAGES AND DEPENDENCIES
# ==========================================
echo "==> Installing base software, runtimes, and compiler toolchains..."

if [ "$PM" = "pacman" ]; then
    # CachyOS handles Neovim 0.12 native tracking cleanly inside extra repos
    sudo pacman -Syu --needed --noconfirm \
        kitty fish neovim \
        base-devel cmake unzip ninja curl git \
        nodejs npm python-pipx rustup \
        wl-clipboard xclip ripgrep fd fzf stow

    # Initialize Rust stable build chain toolset
    if ! command -v cargo &> /dev/null; then
        rustup default stable
    fi

elif [ "$PM" = "apt" ]; then
    sudo apt-get update -y
    sudo apt-get install -y \
        kitty fish \
        build-essential cmake unzip ninja-build gettext curl git \
        nodejs npm pipx cargo \
        wl-clipboard xclip ripgrep findutils fzf stow

    # Ensure pipx execution path binaries register correctly
    pipx ensurepath

    # ==========================================
    # 2. BUILD NEOVIM 0.12 FROM SOURCE (APT COMPAT)
    # ==========================================
    echo "==> Building Neovim 0.12 from source release tag..."
    SRC_DIR=$(mktemp -d)
    git clone --depth 1 --branch v0.12.1 https://github.com/neovim/neovim.git "$SRC_DIR"
    
    cd "$SRC_DIR"
    make CMAKE_BUILD_TYPE=Release
    sudo make install
    
    cd -
    rm -rf "$SRC_DIR"
fi

echo "[+] Core software packages and dev runtimes successfully installed."

# ==========================================
# 3. INTERACTIVE SHELL ENVIRONMENT MIGRATION
# ==========================================
if [ "${SHELL}" != "$(which fish)" ]; then
    echo "==> Changing default shell environment to Fish..."
    chsh -s "$(which fish)"
fi

# ==========================================
# 4. ENVIRONMENT INPUT & KEYBOARD CONFIGURATION
# ==========================================
echo "==> Configuring input sources and key overrides..."

if [ "$PM" = "pacman" ] || [[ "$DE" == *"KDE"* ]]; then
    echo "    Applying configurations for KDE Plasma Engine..."
    
    # Ensure config path directory exists
    mkdir -p ~/.config

    # Configure multiple layouts (US and Real Programmer's Dvorak) inside Plasma configuration
    kwriteconfig6 --file ~/.config/kxkbrc --group "Layout" --key "LayoutList" "us,real-prog-dvorak"
    kwriteconfig6 --file ~/.config/kxkbrc --group "Layout" --key "Use" "true"
    
    # Inject Caps Lock / Escape swap rule option into Plasma layout sub-keys
    kwriteconfig6 --file ~/.config/kxkbrc --group "Layout" --key "Options" "caps:swapescape"

    # Reload the configuration engine immediately across current active XKB sessions
    qdbus6 org.kde.keyboard /Layouts reconfigure || true
else
    echo "    Applying configurations for GNOME/XFCE (Debian/Kali/REMnux)..."
    # GNOME environment mapping
    gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'real-prog-dvorak')]"
    gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
fi

# ==========================================
# 5. AUTOMATIC DOTFILES SYMLINK STOWING
# ==========================================
echo "==> Preparing system profile paths for GNU Stow orchestration..."

# Purge any existing folder target collisions before linking
rm -rf ~/.config/xkb

# Run Stow deployment targeting current execution context folder
if [ -d "$HOME/dotfiles" ]; then
    cd "$HOME/dotfiles"
    stow xkb
    echo "[+] Symlinks successfully generated for xkb module."
else
    echo "[-] WARNING: ~/dotfiles directory not detected. Skipping automatic Stow execution step." >&2
fi

echo "[!] SUCCESS: Configuration complete. Restart session to cycle terminal shell environments."
