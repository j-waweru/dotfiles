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

		keys = {
			-- Find
			{ "<leader>f", group = "+find/files" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>f.", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },

			-- Search
			{ "<leader>s", group = "+search" },
			{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
			{ "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>sw", "<cmd>Telescope grep_string<cr>", mode = { "n", "v" }, desc = "Search Word" },

			-- Git
			{ "<leader>g", group = "+git" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },

			-- LSP
			{ "<leader>l", group = "+lsp" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
			{ "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
			{ "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },
			{ "<leader>lo", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Outline" },

			-- Misc
			{ "<leader>m", group = "+misc" },
			{ "<leader>mc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
			{ "<leader>mr", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>mj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
			{ "<leader>mq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
			{ "<leader>mm", "<cmd>Telescope marks<cr>", desc = "Marks" },
		},
	},

	-- =========================================
	-- NEOTREE
	-- =========================================
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			window = {
				position = "float",
				popup = {
					border = "rounded",
					size = {
						width = "70%",
						height = "70%",
					},
					position = "50%",
				},
			},
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle reveal<cr>",
				mode = "n",
				desc = "Explorer",
			},
		},
	},

	-- =========================================
	-- OIL
	-- =========================================
	{
		"stevearc/oil.nvim",

		config = function()
			require("oil").setup({
				float = {
					padding = 2,
					max_width = 0.7,
					max_height = 0.7,
					border = "rounded",
					win_options = {
						winblend = 0,
					},
				},
			})
		end,

		keys = {
			{ "-", "<cmd>Oil --float<cr>", mode = "n", desc = "Oil" },
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
		require("harpoon"):setup()
		end,

		keys = {
			{
				"<leader>ha",
				function()
				require("harpoon"):list():add()
				end,
				desc = "Harpoon add file",
			},
			{
				"<leader>hc",
				function()
				require("harpoon"):list():clear()
				end,
				desc = "Harpoon clear",
			},

			{
				"<leader>hm",
				function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon menu",
			},

			-- File 1
			{
				"<leader>h",
				function()
				require("harpoon"):list():select(1)
				end,
				desc = "Harpoon file 1",
			},

			-- File 2
			{
				"<leader>t",
				function()
				require("harpoon"):list():select(2)
				end,
				desc = "Harpoon file 2",
			},

			-- File 3
			{
				"<leader>n",
				function()
				require("harpoon"):list():select(3)
				end,
				desc = "Harpoon file 3",
			},

			-- File 4
			{
				"<leader>s",
				function()
				require("harpoon"):list():select(4)
				end,
				desc = "Harpoon file 4",
			},

			-- Previous Harpoon file
			{
				"<leader>hk",
				function()
				require("harpoon"):list():prev()
				end,
				desc = "Harpoon previous",
			},

			-- Next Harpoon file
			{
				"<leader>hj",
				function()
				require("harpoon"):list():next()
				end,
				desc = "Harpoon next",
			},

			-- Move current entry up in Harpoon list
			{
				"<leader>hK",
				function()
				local list = require("harpoon"):list()
				local idx = list.config.current_index

				if idx and idx > 1 then
					list:move(idx, idx - 1)
					end
					end,
					desc = "Harpoon move entry up",
			},

			-- Move current entry down in Harpoon list
			{
				"<leader>hJ",
				function()
				local list = require("harpoon"):list()
				local idx = list.config.current_index

				if idx and idx < #list.items then
					list:move(idx, idx + 1)
					end
					end,
					desc = "Harpoon move entry down",
			},
		},
	},

	-- =========================================
	-- UNDOTREE
	-- =========================================
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { -- loads the plugin only when using the keybinding
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle Undotree" },
		},
		opts = {
			position = "float", -- This explicitly forces a floating window layout
			-- Custom settings for your floating window size/appearance
			window = {
				winblend = 10,
			},
		},
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>su", "<cmd>Telescope undo<cr>", desc = "Undo History (Floating)" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					undo = {
						-- your extension configs go here
					},
				},
			})
			require("telescope").load_extension("undo")
		end,
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
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
