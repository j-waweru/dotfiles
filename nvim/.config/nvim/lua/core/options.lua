local opt = vim.opt

-- FOLDING SETTINGS (VSCode Style)
opt.foldcolumn = '0'     -- Show only one column for indicators
opt.foldlevel = 99       -- Ensure most folds are open by default
opt.foldlevelstart = 99 
opt.foldenable = true

-- CUSTOM INDICATORS
-- This replaces the numbers with icons and removes the 'eob' (End of Buffer) tildes
opt.fillchars = {
    foldopen = "",      -- Chevron Down
    foldclose = "",     -- Chevron Right
    fold = " ",          -- Removes the dots/dashes in the fold line
    foldsep = " ",       -- Removes the vertical separator in folds
    eob = " ",           -- Removes the ~ at the end of the file
} -- Enable folding

-- Ibeam cursor
--opt.guicursor = "a:ver25"

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true

-- Appearance and UI
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 999 -- Keeps cursor centered vertically
opt.splitbelow = true
opt.splitright = true

-- System Clipboard
-- Ensure you have 'wl-clipboard' installed (for Wayland) or 'xclip' (for X11)
opt.clipboard = "unnamedplus"

