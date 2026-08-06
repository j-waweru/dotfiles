return {
	-- COMPLETION & EDITING TOOLS
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			"windwp/nvim-autopairs",
		},

		opts = {
			keymap = {
				preset = "default",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "accept", "fallback" },
				["<C-y>"] = { "accept" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
				["<C-f>"] = { "scroll_documentation_up", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				-- Explicitly register command-line providers for cmdline mode integration
				providers = {
					cmdline = {
						name = "cmdline",
						module = "blink.cmp.sources.cmdline",
					},
				},
			},

			snippets = { preset = "luasnip" },

			-- Explicit native command-line configuration mapped for Noice compatibility
			cmdline = {
				enabled = true,
				keymap = { preset = "cmdline" },
				sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
					end
					if type == ":" then
						return { "cmdline", "path" }
						end
						return {}
						end,
						completion = {
							menu = {
								auto_show = true,
							},
						},
			},

			-- Window sizing constraints for the main editor completion
			completion = {
				menu = {
					border = "rounded",
					max_height = 12,
					draw = {
						columns = { { "kind_icon", "label", "label_description", gap = 1 } },
					},
				},
				documentation = {
					window = {
						border = "rounded",
						max_width = 50,
						max_height = 15,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},

	{ "windwp/nvim-autopairs", config = true },
	{ "windwp/nvim-ts-autotag", config = true },
	{ "kylechui/nvim-surround", config = true },

	-- Tabout configuration
	{
		"abecodes/tabout.nvim",
		lazy = false,
		config = function()
		require("tabout").setup({
			tabkey = "<Tab>",
			backwards_tabkey = "<S-Tab>",
			act_as_tab = true,
			completion = false,
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
								{ open = "[", close = "]" },
								{ open = "{", close = "}" },
			},
		})
		end,
		priority = 1000,
	},

	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{ "numToStr/Comment.nvim", config = true },
}
