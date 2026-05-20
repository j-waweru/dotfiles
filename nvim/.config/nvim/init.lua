-- 1. Load your core settings first
require("core.options")
require("core.keymaps")
require("core.autocmds")


-- 2. Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
    end
    vim.opt.rtp:prepend(lazypath)

    -- 3. Setup Lazy
    require("lazy").setup({
        spec = {
{ import = "plugins" },     -- Loads files in lua/plugins/*.lua        
        },
        -- Optional: This handles the "re-sourcing" automatically
        checker = { enabled = true },
    })
