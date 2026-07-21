return
{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				notify_on_error = false,
				formatters = {
					["clang-format"] = {
						args = {
							"--style={BasedOnStyle: LLVM, PointerAlignment: Left}",
						},
					},
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format" },
					c = { "clang-format" },
					cpp = { "clang-format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	}
