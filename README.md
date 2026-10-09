# Dotfiles

Personal dotfiles managed with GNU Stow.

This repository contains configuration files for:

- Kitty
- Neovim
- Fish shell and starship
- xkb and kanata 
- Zellij
- Windows

The setup uses symbolic links managed by GNU Stow to keep configs organized, portable, and version controlled.

---

# Repository Structure

Each top-level directory is a Stow package.

For example:

```text
kitty/.config/kitty/kitty.conf
```

gets symlinked to:

```text
~/.config/kitty/kitty.conf
```

---

# Requirements

Install the required packages:

```bash
sudo pacman -S git stow
```

```bash
sudo apt update
sudo apt install git stow
```

---

# Installation

Clone the repository:

```bash
git clone https://github.com/j-waweru/dotfiles.git ~/dotfiles
```

Enter the directory:

```bash
cd ~/dotfiles
```

Use Stow to create symlinks:

```bash
stow kitty
stow nvim
stow fish
sudo stow --target=/ keyd
```

Or stow everything at once:

```bash
stow */
```

---

# Useful Stow Commands

## Stow a package

```bash
stow kitty
```

## Remove symlinks

```bash
stow -D kitty
```

## Rebuild symlinks

```bash
stow -R kitty
```

## Rebuild all packages

```bash
stow -R */
```

---