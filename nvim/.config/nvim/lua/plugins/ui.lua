----------------------------ayu dark-----------------------------------------

return {

	-- =========================================
	-- THEME: Ayu Dark
	-- =========================================
	{
		"Shatur/neovim-ayu",
		config = function()
			require("ayu").setup({ mirage = false })
			vim.cmd("colorscheme ayu-dark")
			vim.opt.signcolumn = "yes"

			local grp = vim.api.nvim_create_augroup("AyuFix", { clear = true })

			vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
				group = grp,
				callback = function()
					vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
				end,
			})
		end,
	},

	-- =========================================
	-- TRANSPARENCY (FIXED)
	-- =========================================
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup({
				extra_groups = {
					"NormalFloat",
					"NvimTreeNormal",
					"NeoTreeNormal",
					"NeoTreeNormalNC",
					"NeoTreeWinSeparator",
					"StatusLine",
					"StatusLineNC",
					"SignColumn",
					"FoldColumn",
				},

				exclude_groups = {
					"LineNr",
					"CursorLineNr",
				},
			})

			vim.cmd("TransparentEnable")

			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
			vim.api.nvim_set_hl(0, "CursorLineSign", { bg = "none" })
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
		end,
	},
}
