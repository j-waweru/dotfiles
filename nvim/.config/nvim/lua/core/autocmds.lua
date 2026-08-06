local au = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup

local key = vim.keymap.set
vim.g.mapleader = " "

-- 1. Highlight on Yank
au("TextYankPost", {
	desc = "Highlight when yanking text",
	group = group("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

-- 2. Auto-Save + Auto-Format Sync
-- This triggers when leaving Insert mode or changing text
au({ "InsertLeave", "TextChanged" }, {
	group = group("auto-save-format", { clear = true }),
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" then
			-- First, try to format using conform
			-- We use pcall to prevent errors if conform isn't loaded yet
			local status, conform = pcall(require, "conform")
			if status then
				conform.format({ bufnr = 0, lsp_fallback = true }, function()
					-- Save AFTER formatting is done
					vim.schedule(function()
						vim.cmd("silent! write")
					end)
				end)
			else
				-- If conform isn't available, just save
				vim.cmd("silent! write")
			end
		end
	end,
})

-- Run Code
key("n", "<leader>ru", function()
	local ft = vim.bo.filetype
	local cmd = ""
	if ft == "python" then
		cmd = "python3 " .. vim.fn.expand("%")
	elseif ft == "cpp" then
		cmd = "g++ " .. vim.fn.expand("%") .. " -o out && ./out"
	elseif ft == "c" then
		cmd = "gcc -Wall -Wextra " .. vim.fn.expand("%") .. " -o out && ./out"
	elseif ft == "sh" then
		cmd = "bash " .. vim.fn.expand("%")
	elseif ft == "rust" then
		cmd = "cargo run"
	elseif ft == "lua" then
		vim.cmd("source %")
		return
	end

	if cmd ~= "" then
		vim.cmd("split | term " .. cmd)
		vim.cmd("resize 10")
		vim.cmd("startinsert")
	end
end)

--------overide-------------------------
-- 3. FIX: Persistent Line Number Colors
-- This ensures that even if Ayu or Transparent.nvim loads late,
-- your custom line number colors are forced back on top.
au("ColorScheme", {
	group = group("fix-line-numbers", { clear = true }),
	callback = function()
		local hl = vim.api.nvim_set_hl
		hl(0, "LineNr", { fg = "#ffcc66" })
		hl(0, "LineNrAbove", { fg = "#a8a8a8" })
		hl(0, "LineNrBelow", { fg = "#a8a8a8" })
		hl(0, "CursorLineNr", { fg = "#ffcc66", bold = true })
		hl(0, "Comment", { fg = "#8FA1B3", italic = true })
		hl(0, "IblIndent", { fg = "#4f4f4f" })
		hl(0, "IblScope", { fg = "#ffcc66", bold = true })
	end,
})
