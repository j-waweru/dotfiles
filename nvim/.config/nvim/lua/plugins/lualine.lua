	-- =========================================
	-- LUALINE
	-- =========================================
	return {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "ayu",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},

				sections = {
					lualine_x = {
						{
							require("ipynb.kernel").statusline,
							cond = require("ipynb.kernel").statusline_visible,
							color = require("ipynb.kernel").statusline_color,
						},
					},
				},
			})
		end,
	}
