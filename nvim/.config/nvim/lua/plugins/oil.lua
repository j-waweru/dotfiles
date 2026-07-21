return 	-- =========================================
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
	}
