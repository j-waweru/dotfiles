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
	}


}
