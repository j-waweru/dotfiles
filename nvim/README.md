---

# Neovim 0.12 Setup & Reference

Guide covers setup for professional modular environment. Works on **CachyOS** and **Ubuntu**.

## Step 1: Install Neovim and System Dependencies

The script to download is found in
dotfiles/aptinstall.sh 
or 
dotfiles/pacman.sh

---
## Features and Plugins

telescope,neotree,oil.nvim,undotree,nvim ufo, indent-blankline,flash.nvim , mason and masontool installer, conform, fugitive, treesitter ,render-markdown and markdown-preview ,harpoon , ayu dark, lualine ,noice , transparent.nvim ,nvim cmp ,luasnip,friendlysnippets,cmp_luasnip, ,autopairs autotags sorround comment.nvim and nvim sorround, trouble.nvim ,


---

## Keymap Reference Sheet

### **1. Navigation & UI**

* **`<Leader> e`**: Toggle **Neo-tree**. Focuses current file.
* **`<Leader> ff`**: **Find Files**. Telescope search.
* **`<Leader> fg`**: **Live Grep**. Project-wide text search.
* **`<Leader> ss`**: **Symbol Search**. Jump to functions/structs.
* **`<Leader> ;`**: Command mode shortcut.
* **`<Leader> nh`**: Clear search highlights.
* **`-`** (Minus): Open **Oil.nvim**. Edit folders like text.
* **`Ctrl + h/j/k/l`**: Move focus between split windows.

### **2. Editing & Motion**

* **`s` (Flash)**: Type `s` + 2 chars to jump anywhere.
* **`<Tab>`** (Inside brackets/quotes): **Tabout**. Jumps out instantly.
* **`ysw[char]`**: **Surround** Word.
* **`ds[char]`**: **Delete** Surround.
* **`cs[old][new]`**: **Change** Surround.
* **`gcc`**: Comment/Uncomment line.

### **3. Intellisense & LSP (0.12 Native)**

* **`K`**: **Hover**. Shows documentation/signatures.
* **`gd`**: **Go to Definition**.
* **`<Leader> ca`**: **Code Actions**. Quick-fixes.
* **`<Leader> rn`**: **Smart Rename**. Project-wide.
* **`Tab` / `S-Tab**`: Navigate autocomplete list.
* **`<Leader> d`**: Open **Trouble** diagnostics list. [Focus] [true].

### **4. Workflow & System**

* **`<Leader> gs`**: **Fugitive**. Git status and staging.
* **`<Leader> u`**: **UndoTree**. Visual undo history.
* **`<Leader> s`**: Global Search & Replace. Populates word under cursor.
* **`<Leader> x`**: **Chmod +x**. Make current file executable.
* **`<Leader> mp`**: **Markdown Preview**. Toggle browser view.
* **`<Leader> ha/hh`**: **Harpoon**. Pin and switch files.

### **5. Execution**

* **`<Leader> r`**: **Interactive Runner**.
* **C**: `gcc [file] -o out && ./out`
* **Python**: `python3 [file]`
* **Bash**: `bash [file]`
* **Lua**: `source %`

```
