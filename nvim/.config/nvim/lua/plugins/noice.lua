	-- =========================================
	-- NOICE + NOTIFY
	-- =========================================
	return{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
					fps = 30,
					render = "default",
					timeout = 3000,
				},
			},
		},
		config = function()
			require("noice").setup({
				cmdline = {
					view = "cmdline_popup",
					format = {
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					},
				},
				presets = {
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
				},
			})
		end,
	},
