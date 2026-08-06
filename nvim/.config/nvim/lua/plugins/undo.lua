return {
	{
		"debugloop/telescope-undo.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
			},
		},

		keys = {
			{
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "Undo History",
			},
		},

		opts = {
			extensions = {
				undo = {
					-- Preview
					use_delta = true, -- Uses delta if installed
					side_by_side = true, -- Side-by-side diff
					use_custom_command = nil,

					-- Diff settings
					vim_diff_opts = {
						ctxlen = vim.o.scrolloff,
					},

					-- Display
					entry_format = "󰕌  #$ID  $STAT  $TIME",
					time_format = "",
					saved_only = false,

					-- Keymaps inside Telescope Undo
					mappings = {
						i = {
							["<CR>"] = function(bufnr)
								require("telescope-undo.actions").yank_additions(bufnr)
							end,
							["<S-CR>"] = function(bufnr)
								require("telescope-undo.actions").yank_deletions(bufnr)
							end,
							["<C-r>"] = function(bufnr)
								require("telescope-undo.actions").restore(bufnr)
							end,
							["<C-y>"] = function(bufnr)
								require("telescope-undo.actions").yank_deletions(bufnr)
							end,
						},
						n = {
							["y"] = function(bufnr)
								require("telescope-undo.actions").yank_additions(bufnr)
							end,
							["Y"] = function(bufnr)
								require("telescope-undo.actions").yank_deletions(bufnr)
							end,
							["u"] = function(bufnr)
								require("telescope-undo.actions").restore(bufnr)
							end,
						},
					},
				},
			},
		},

		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("undo")
		end,
	},
}
