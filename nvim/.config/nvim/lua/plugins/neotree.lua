-- =========================================
	-- NEOTREE
	-- =========================================
	return {
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
	}
