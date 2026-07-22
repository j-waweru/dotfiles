local opt = vim.opt
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.nrformats = {}
-- Enable spell checking
opt.spell = false
opt.spelllang = { "en" }

-- FOLDING SETTINGS (VSCode Style)
opt.foldcolumn = "0" -- Show only one column for indicators
opt.foldlevel = 99 -- Ensure most folds are open by default
opt.foldlevelstart = 99
opt.foldenable = true

-- CUSTOM INDICATORS
-- This replaces the numbers with icons and removes the 'eob' (End of Buffer) tildes
opt.fillchars = {
	foldopen = "", -- Chevron Down
	foldclose = "", -- Chevron Right
	fold = " ", -- Removes the dots/dashes in the fold line
	foldsep = " ", -- Removes the vertical separator in folds
	eob = " ", -- Removes the ~ at the end of the file
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
opt.virtualedit = "block"
opt.inccommand = "split"
opt.ignorecase = true

-- Appearance and UI
opt.termguicolors = true
opt.wrap = false
opt.splitbelow = true
opt.splitright = true

-- System Clipboard
-- Ensure you have 'wl-clipboard' installed (for Wayland) or 'xclip' (for X11)
opt.clipboard = "unnamedplus"

opt.redrawtime = 10000 -- Increase the timeout to 10 seconds
opt.re = 0 -- Use the automatic/modern regex engine

opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undo_dir")

-- Normal Visual Mode
vim.api.nvim_set_hl(0, "Visual", { bg = "#3e4452", fg = "#61afef" })

-- Visual Line Mode (Shift+V)
vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#4b5263", fg = "#98c379" })

-- Visual Block Mode (Ctrl+V)
vim.api.nvim_set_hl(0, "VisualBlock", { bg = "#c678dd", fg = "#282c34" })
