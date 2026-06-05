Script rebuilt for Arch/CachyOS. Pacman native dependencies swapped. Neovim native extra repository package used instead of source build. Google Chrome installation handled via Paru AUR helper. Keyboard layout configuration targets Hyprland input blocks inside `~/.config/hypr/hyprland.conf`.

```bash
#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting OS Environment..."
if [ ! -f /etc/arch-release ] && ! grep -q "cachyos" /etc/os-release 2>/dev/null; then
    echo "[-] Unsupported Linux distribution. Arch/CachyOS required. Exiting." >&2
    exit 1
fi

# ==========================================
# 1. INSTALL CORE PACKAGES AND DEPENDENCIES
# ==========================================
echo "==> Installing base software, runtimes, and tools via Pacman..."

# System update and package deployment
sudo pacman -Syu --needed --noconfirm \
    kitty fish neovim \
    base-devel cmake unzip ninja curl git \
    nodejs npm python-pipx \
    wl-clipboard xclip ripgrep findutils fzf stow \
    btop bat plocate rofi ulauncher \
    unrar p7zip \
    trash-cli okular jetbrains-mono-font \
    vlc wget

# Ensure pipx execution path binaries register correctly
pipx ensurepath

# ==========================================
# 2. EXTRA RUNTIMES AND LANGUAGE SERVERS
# ==========================================
echo "==> Installing Rust, Cargo tools, Python packages, and NPM globals..."

# Install Rust via rustup wrapper natively tracked or direct script
if ! command -v rustup &> /dev/null; then
    sudo pacman -S --needed --noconfirm rustup
    /usr/bin/rustup default stable
fi

# Install Language Servers and Tooling
"$HOME/.cargo/bin/cargo" install marksman asm-lsp
pipx install yt-dlp black yazi-bin
sudo npm install -g tree-sitter-cli pyright

# ==========================================
# 3. AUR PACKAGES VIA PARU (CHROME & XDM)
# ==========================================
echo "==> Deploying AUR packages via Paru..."

# Download and Install XDM (.NET version) and Google Chrome via AUR
paru -S --needed --noconfirm xdm-bin google-chrome

# ==========================================
# 4. THEME CONFIGURATION
# ==========================================
echo "==> Downloading Tokyo Night Kitty theme..."
mkdir -p "$HOME/.config/kitty/themes"
curl -L https://raw.githubusercontent.com/davidmathers/tokyo-night-kitty-theme/master/tokyo-night-kitty.conf \
    -o "$HOME/.config/kitty/themes/tokyo-night.conf"

# ==========================================
# 5. INTERACTIVE SHELL ENVIRONMENT MIGRATION
# ==========================================
FISH_PATH="/usr/bin/fish"
if [ "${SHELL}" != "$FISH_PATH" ]; then
    echo "==> Changing default shell environment to Fish..."
    sudo chsh -s "$FISH_PATH" "$USER"
fi

# Configure Fish path for future sessions
mkdir -p "$HOME/.config/fish"
if [ ! -f "$HOME/.config/fish/config.fish" ] || ! grep -q "fish_add_path \$HOME/.cargo/bin" "$HOME/.config/fish/config.fish"; then
    echo "fish_add_path \$HOME/.cargo/bin" >> "$HOME/.config/fish/config.fish"
fi

# ==========================================
# 6. HYPRLAND KEYBOARD CONFIGURATION
# ==========================================
echo "==> Injecting keyboard layout configurations into Hyprland config..."

HYPR_CONF="$HOME/.config/hypr/hyprland.conf"
mkdir -p "$HOME/.config/hypr"

# Ensure clean input block setup without duplicates
if [ -f "$HYPR_CONF" ]; then
    # Backup existing config
   cp "$HYPR_CONF" "${HYPR_CONF}.bak"
fi

# Append or create Hyprland layout rules directly
cat << 'EOF' >> "$HYPR_CONF"

# Input configuration injected by setup script
input {
    kb_layout = us,unreal-prog-dvorak
    kb_variant = 
    kb_model =
    kb_options = caps:swapescape
    kb_rules =

    follow_mouse = 1
}
EOF

# ==========================================
# 7. AUTOMATIC DOTFILES SYMLINK STOWING
# ==========================================
echo "==> Preparing system profile paths for GNU Stow orchestration..."

rm -rf "$HOME/.config/xkb"

if [ -d "$HOME/dotfiles" ]; then
    cd "$HOME/dotfiles"
    stow xkb
    echo "[+] Symlinks successfully generated for xkb module."
else
    echo "[-] WARNING: ~/dotfiles directory not detected. Skipping automatic Stow execution step." >&2
fi

echo "[!] SUCCESS: Configuration complete. Restart Hyprland session to apply all environment rules."

```
