return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- This is CRITICAL. It runs every time the plugin updates.
        build = ":TSUpdate", 
        lazy = false, -- Force load on startup to ensure parsers are ready
        opts = {
            ensure_installed = { 
                "c", "lua", "vim", "vimdoc", "query", 
                "markdown", "markdown_inline", "python", 
                "bash", "asm" 
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            -- For nvim-treesitter 1.0.0+
            require("nvim-treesitter").setup(opts)
        end,
    },
}
