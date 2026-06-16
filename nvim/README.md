# Neovim 0.12 Setup & Reference

Custom keymaps + plugin purpose.

Leader key: `<Space>`

---

## Telescope

Plugin: `telescope.nvim`

Fuzzy finder for files, text search, LSP symbols.

| Keymap | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fs` | LSP document symbols |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sw` | Search current word (n/v) |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Search resume |
| `<leader>s.` | Search recent files |
| `<leader>sc` | Search commands |
| `<leader><leader>` | Find existing buffers |

---

## Comment

Plugin: `Comment.nvim`

Fast line/block commenting.

| Keymap | Action |
| --- | --- |
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Toggle selection comment |
| `gb` (visual) | Toggle block comment |

---

## Surround

Plugin: `nvim-surround`

Add/change/delete brackets, quotes, tags.

| Keymap | Action |
| --- | --- |
| `ys` | Add surround |
| `yss` | Surround line |
| `yS` | Surround motion (new lines) |
| `ySS` | Surround line (new lines) |
| `ds` | Delete surround |
| `cs` | Change surround |

---

## Ufo (Fold)

Plugin: `nvim-ufo`

Enhanced folding UI.

| Keymap | Action |
| --- | --- |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Fold less |
| `zm` | Fold more |
| `zp` | Peek fold |

---

## LSP

Built-in Neovim LSP client

Code intelligence: rename, refs, actions, navigation.

| Keymap | Action |
| --- | --- |
| `grr` | References |
| `grn` | Rename |
| `gra` | Code action |
| `gri` | Implementation |
| `grt` | Type definition |

---

## Trouble

Plugin: `trouble.nvim`

Diagnostics + quickfix viewer UI.

| Keymap | Action |
| --- | --- |
| `<leader>d` | Diagnostics |
| `<leader>df` | Buffer diagnostics |

---

## Harpoon

Plugin: `harpoon`

Quick file bookmarks + jump system.

| Keymap | Action |
| --- | --- |
| `<leader>ha` | Add file |
| `<leader>hh` | Open menu |

---

## Undotree

Plugin: `undotree`

Visual undo history tree.

| Keymap | Action |
| --- | --- |
| `<leader>u` | Toggle undo tree |

---

## File Explorer

Plugins: `neo-tree.nvim`, `oil.nvim`

Tree + minimal filesystem navigation.

| Keymap | Action |
| --- | --- |
| `<leader>e` | File explorer |
| `-` | Parent directory (oil) |

---

## Git

Plugins: `lazygit`

Git integration + diff + staging.

| Keymap | Action |
| --- | --- |
| `<leader>lg` | Lazygit |

---

## Debug (DAP)

Plugin: `nvim-dap`

Debugger integration for breakpoints + stepping.

| Keymap | Action |
| --- | --- |
| `<F5>` | Continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Last session |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set breakpoint |

---

## Markdown

Plugin: `markdown-preview.nvim`

Live markdown preview in browser.

| Keymap | Action |
| --- | --- |
| `<leader>mp` | Preview markdown |

---

## Navigation (custom)

Small workflow shortcuts.

| Keymap | Action |
| --- | --- |
| `<leader>nh` | Clear search highlight |
| `<leader>;` | Command mode |
| `<leader>x` | chmod +x current file |
| `<leader>s` | Substitute word under cursor |

---

## Window navigation

Built-in window movement.

| Keymap | Action |
| --- | --- |
| `<C-h>` | Move left |
| `<C-j>` | Move down |
| `<C-k>` | Move up |
| `<C-l>` | Move right |

---

## Completion

Plugins: `nvim-cmp`, `blink.cmp`, `LuaSnip`

Autocompletion + snippets engine.

| Keymap | Action |
| --- | --- |
| `<C-n>` | Next completion |
| `<C-P>` | Previous completion |
| `Enter` | Accept completion |

---

## Execution

| Keymap | Action |
| --- | --- |
| `<leader>r` | Interactive Runner |

* **C**: `gcc [file] -o out && ./out`
* **Python**: `python3 [file]`
* **Bash**: `bash [file]`
* **Lua**: `source %`

## Notes

* Leader: `<Space>`
* Completion + snippets handled by multiple engines (`cmp`, `blink`, `luasnip`)
* Many LSP defaults not listed unless overridden
