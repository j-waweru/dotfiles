return {
  "rmagatti/auto-session",
  lazy = false, -- Load immediately to handle startup session restores
  opts = {
  
    ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
    -- Prevent session creation in specific common directories
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    
    -- Automatically save the session when exiting Neovim
    auto_save = true,
    
    -- Automatically restore the session when starting Neovim
    auto_restore = true,
  },
}

