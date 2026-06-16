return {
    -- =========================================
    -- TELESCOPE
    -- =========================================
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({})

            vim.keymap.set("n", "<leader>z", function()
                builtin.spell_suggest(require("telescope.themes").get_cursor({}))
            end, { desc = "Spell Suggestions" })
        end,

        keys = 
        {
           -- Telescope keymaps
{"<leader>f", group = "+find/files" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  { "<leader>f.", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  
  { "<leader>s", group = "+search" },
  { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
  { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP Symbols" },
  { "<leader>sw", "<cmd>Telescope grep_string<cr>", mode = { "n", "v" }, desc = "Search Word" },
}
    },

    -- =========================================
    -- NEOTREE
    -- =========================================
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,

        keys = {
            { "<leader>e", "<cmd>Neotree toggle reveal<cr>", mode = "n", desc = "Explorer" },
        },
    },

    -- =========================================
    -- OIL
    -- =========================================
    {
        "stevearc/oil.nvim",
        config = true,

        keys = {
            { "-", "<cmd>Oil<cr>", mode = "n", desc = "Oil" },
        },
    },

    -- =========================================
    -- HARPOON
    -- =========================================
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("harpoon").setup()
        end,

        keys = {
            {
                "<leader>ha",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Harpoon Add",
            },
            {
                "<leader>hh",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Harpoon Menu",
            },
        },
    },

    -- =========================================
    -- UNDOTREE
    -- =========================================
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, mode = "n", desc = "Undotree" },
        },
    },

    -- =========================================
    -- UFO
    -- =========================================
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            require("ufo").setup({
                provider_selector = function()
                    return { "treesitter", "indent" }
                end,
            })
        end,
    },

    -- =========================================
    -- INDENT
    -- =========================================
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "│" },
            scope = { enabled = true, show_start = false, show_end = false },
        },
    },

    -- =========================================
    -- FLASH
    -- =========================================
    {
        "folke/flash.nvim",
        opts = {
            modes = {
                char = { enabled = false },
                search = { enabled = false },
            },
        },
        keys = {
            {
                "<leader>s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
            },
        },
    },
}
