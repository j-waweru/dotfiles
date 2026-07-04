# Zellij Sessionizer

A project-oriented workflow built around **Zellij**, **Fish**, **fzf**, **fd**, **zoxide**, and **Neovim**.

## Philosophy

One project = One Zellij session.

Each project has its own workspace, layout, shell history, editor state, and running commands.

Instead of manually changing directories and starting Zellij:

```bash
cd ~/work/reverse/crackme1
zellij
```

use:

```bash
z
```

Select a project and immediately enter the correct workspace.

---

# Directory Structure

Projects live under `~/work`.

```text
~/work
├── reverse
│   ├── crackme1
│   ├── malware-lab
│   └── elf-loader
│
├── notes
│   ├── csapp
│   ├── intel-manual
│   └── ghidra-book
│
├── systems
│   ├── allocator
│   ├── compiler
│   └── kernel
│
└── misc
```

The parent directory determines which Zellij layout is loaded.

| Directory       | Layout        |
| --------------- | ------------- |
| `reverse/`      | `reverse.kdl` |
| `notes/`        | `notes.kdl`   |
| everything else | `dev.kdl`     |

---

# Sessionizer

The `sessionizer` script:

* searches projects using `zoxide`
* discovers new projects with `fd`
* presents an `fzf` picker
* loads the appropriate layout
* creates a session if one doesn't exist
* attaches to the existing session if it does

This means reopening a project restores the exact workspace.

---

# Layouts

## reverse.kdl

Used for reverse engineering.

```
+----------------------------------+
|                                  |
|            Neovim                |
|                                  |
+------------------+---------------+
| shell            | btop          |
+------------------+---------------+
```

Typical tools:

* gdb
* Ghidra
* objdump
* readelf
* strings
* radare2
* pwndbg

---

## notes.kdl

Single full-screen Neovim window.

Ideal for:

* book notes
* university notes
* documentation
* research

---

## dev.kdl

```
+----------------------------------+
|                                  |
|            Neovim                |
|                                  |
+------------------+---------------+
| shell            | shell         |
+------------------+---------------+
```

Used for:

* C
* Rust
* Zig
* systems programming
* personal projects

---

# Daily Workflow

Open a project:

```bash
z
```

Choose:

```
reverse/crackme5
```

Sessionizer automatically:

* changes directory
* creates or attaches to the session
* loads the correct layout
* opens Neovim

No additional setup required.

---

# Starting a New Project

Example:

```bash
mkdir -p ~/work/reverse/crackme20
cd ~/work/reverse/crackme20

touch README.md
touch notes.md
mkdir scripts
mkdir dumps
mkdir screenshots
```

Run:

```bash
z
```

Select `crackme20`.

---

# Session Persistence

Sessions are automatically serialized by Zellij.

Closing the terminal does **not** destroy the workspace.

Running:

```bash
z
```

again resumes the previous session.

---

# Keybindings

Custom shortcuts avoid conflicts with Neovim.

| Shortcut    | Action             |
| ----------- | ------------------ |
| Alt+h/j/k/l | Move between panes |
| Alt+v       | Vertical split     |
| Alt+s       | Horizontal split   |
| Alt+n       | New pane           |
| Alt+x       | Close pane         |
| Alt+t       | New tab            |
| Alt+,       | Previous tab       |
| Alt+.       | Next tab           |
| Alt+o       | Toggle fullscreen  |
| Alt+r       | Rename pane        |
| Alt+Shift+r | Rename tab         |
| Alt+g       | Lock/Unlock        |
| Alt+q       | Quit Zellij        |

Everything else uses the default Zellij keybindings.

---

# Dependencies

Required packages:

* zellij
* fish
* fzf
* fd
* zoxide
* bat
* eza
* GNU Stow
* Neovim

---

# Installation

Clone the dotfiles repository.

```bash
git clone <repo> ~/dotfiles
```

Symlink the configuration.

```fish
cd ~/dotfiles

stow fish
stow bin
stow zellij
stow nvim
stow git
```

Restart Fish or run:

```fish
source ~/.config/fish/config.fish
```

The `z` command is now available.

---

# Design Goals

* One session per project.
* Fast project switching.
* Zero manual pane setup.
* Neovim-friendly keybindings.
* Portable via GNU Stow.
* Minimal configuration.
* Easy to extend with additional layouts or project types.

