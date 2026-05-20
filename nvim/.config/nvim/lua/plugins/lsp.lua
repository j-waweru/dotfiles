return {

    -- MASON: Binary manager
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },

    -- TOOL INSTALLER: Auto-download formatters and LSPs
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                -- LSPs
                "clangd",
                "asm-lsp",
                "pyright",
                "marksman",
                "lua-language-server",
                "bash-language-server",
                -- Formatters
                "stylua",
                "black",
                "clang-format",
            },
            auto_update = true,
            run_on_start = true,
        },
    },

    -- LSP CONFIG: Neovim 0.11/0.12 Native API
    {
        "neovim/nvim-lspconfig",
        dependencies = { 
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason-lspconfig").setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local servers = { 'clangd', 'asm_lsp', 'pyright', 'marksman', 'lua_ls', 'bashls' }

            -- Config and Enable loop
            for _, lsp in ipairs(servers) do
                vim.lsp.config(lsp, {
                    capabilities = capabilities
                })
                vim.lsp.enable(lsp)
            end

            -- High-visibility diagnostic settings
            vim.diagnostic.config({
                virtual_text = {
                    severity = { min = vim.diagnostic.severity.ERROR },
                    prefix = '●'
                },
                signs = { severity = { min = vim.diagnostic.severity.ERROR } },
                underline = { severity = { min = vim.diagnostic.severity.ERROR } },
                severity_sort = true,
            })

            -- Native keybinds
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                end,
            })
        end
    },

    -- CONFORM: Auto-format
    {
        "stevearc/conform.nvim",
        dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = function()
            require("conform").setup({
                formatters_by_ft = { 
                    lua = { "stylua" }, 
                    python = { "black" }, 
                    c = { "clang-format" } 
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end
    },

    -- FUGITIVE: Git integration
    { 
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        end
    },
}
