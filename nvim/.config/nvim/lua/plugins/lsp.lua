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
	-- LSP STATUS
	-- =========================================
	{
		"j-hui/fidget.nvim",
		opts = {},
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
			"williamboman/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"j-hui/fidget.nvim",
		},

		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			-- Default config for every server
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"it",
								"describe",
								"before_each",
								"after_each",
							},
						},
					},
				},
			})

			-- Diagnostics
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,

				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Diagnostics
					vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
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
				notify_on_error = false,
				formatters = {
					["clang-format"] = {
						args = {
							"--style={BasedOnStyle: LLVM, PointerAlignment: Left}",
						},
					},
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format" },
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
}
