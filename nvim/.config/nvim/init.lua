-- 1. Load your core settings first
vim.opt.runtimepath:append("/home/waweru/.local/share/nvim/site/")
vim.lsp.semantic_tokens.enable(true)

require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 2. Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- 3. Setup Lazy
require("lazy").setup({
	spec = {
		{ import = "plugins" }, -- Loads files in lua/plugins/*.lua
	},
	-- Optional: This handles the "re-sourcing" automatically
	checker = { enabled = true },
})

vim.opt.runtimepath:append("/home/waweru/.local/share/nvim/site/")

--- Normal Visual Mode
vim.api.nvim_set_hl(0, "Visual", { bg = "#3e4452", fg = "#61afef" })

-- Visual Line Mode (Shift+V)
vim.api.nvim_set_hl(0, "VisualNOS", { bg = "#4b5263", fg = "#98c379" })

-- Visual Block Mode (Ctrl+V)
vim.api.nvim_set_hl(0, "VisualBlock", { bg = "#c678dd", fg = "#282c34" })
