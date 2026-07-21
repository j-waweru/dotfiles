-- =========================================
	-- TELESCOPE
	-- =========================================
	return{
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
	}
