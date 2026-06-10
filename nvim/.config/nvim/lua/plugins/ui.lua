return {

    -- =========================================
    -- THEME: Ayu Dark
    -- =========================================
    {
        "Shatur/neovim-ayu",
        config = function()
            require("ayu").setup({ mirage = false })
            vim.cmd("colorscheme ayu-dark")
            vim.opt.signcolumn = "no"

            local grp = vim.api.nvim_create_augroup("AyuFix", { clear = true })

            vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
                group = grp,
                callback = function()
                    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
                end,
            })
        end,
    },

    -- =========================================
    -- LUALINE
    -- =========================================
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "ayu",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                },
            })
        end,
    },

    -- =========================================
    -- NOICE + NOTIFY
    -- =========================================
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    background_colour = "#000000",
                    fps = 30,
                    render = "default",
                    timeout = 3000,
                },
            },
        },
        config = function()
            require("noice").setup({
                cmdline = {
                    view = "cmdline_popup",
                    format = {
                        cmdline = { pattern = "^:", icon = "", lang = "vim" },
                        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    },
                },
                presets = {
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                },
            })
        end,
    },

    -- =========================================
    -- TRANSPARENCY (FIXED)
    -- =========================================
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NormalFloat",
                    "NvimTreeNormal",
                    "NeoTreeNormal",
                    "NeoTreeNormalNC",
                    "NeoTreeWinSeparator",
                    "StatusLine",
                    "StatusLineNC",
                    "SignColumn",
                    "FoldColumn",
                },

                exclude_groups = {
                    "LineNr",
                    "CursorLineNr",
                },
            })

            vim.cmd("TransparentEnable")

            vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
            vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
        end,
    },
}
