return {
	-- COMPLETION & EDITING TOOLS
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"windwp/nvim-autopairs",

			-- Additional completion sources
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VSCode snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },

				mapping = {
					-- Trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Next item
					["<C-n>"] = cmp.mapping.select_next_item(),

					-- Previous item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Accept selection
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- Close menu
					["<C-e>"] = cmp.mapping.abort(),

					-- Snippet jumping
					["<C-l>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-h>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			-- Enable completion in ':' command line
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
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
	},

	{ "numToStr/Comment.nvim", config = true },
}
