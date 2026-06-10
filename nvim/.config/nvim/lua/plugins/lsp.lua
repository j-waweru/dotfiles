return {

    -- =========================================
    -- MASON CORE
    -- =========================================
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
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- =========================================
    -- TOOL INSTALLER
    -- =========================================
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

                -- Web
                "typescript-language-server",
                "html-lsp",
                "css-lsp",
                "tailwindcss-language-server",
                "emmet-language-server",
                "json-lsp",
                "eslint-lsp",

                -- C/C++
                "clang-format",

                -- Rust
                "rust-analyzer",

                -- Go
                "gopls",
                "goimports",
                "gofumpt",

                -- Python
                "black",
                "isort",
                "ruff",
                "debugpy",

                -- PowerShell
                "powershell-editor-services",

                -- Bash
                "shellcheck",
                "shfmt",

                -- Lua
                "stylua",

                -- Markdown
                "markdownlint",

                -- YAML / TOML
                "yaml-language-server",
                "taplo",

                -- Docker
                "dockerfile-language-server",
                "docker-compose-language-service",

                -- SQL
                "sqlfluff",

                -- Misc
                "prettierd",
                "biome",
            },
            auto_update = true,
            run_on_start = true,
        },
    },

    -- =========================================
    -- LSP CONFIG
    -- =========================================
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- IMPORTANT: auto-enable servers
            require("mason-lspconfig").setup({
                automatic_enable = true,
            })

            -- global LSP config
            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            -- lua special config
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- diagnostics
            vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
        prefix = "●",
        spacing = 2,
    },

    signs = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

            -- LSP keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },

    -- =========================================
    -- CONFORM
    -- =========================================
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    c = { "clang-format" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },

    -- =========================================
    -- FUGITIVE
    -- =========================================
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", vim.cmd.Git, mode = "n", desc = "Git Status" },
        },
    },
}
