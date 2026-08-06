local key = vim.keymap.set
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.g.mapleader = " "

-- Search & Replace
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- key("n", "<leader>;", ":")
-- key("n", "<leader>nh", ":nohlsearch<CR>")
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

key("n", "<C-h>", "<C-w>h")
key("n", "<C-j>", "<C-w>j")
key("n", "<C-k>", "<C-w>k")
key("n", "<C-l>", "<C-w>l")

-- Save and quit with <Leader>wq
key("n", "<Leader>e", "<Cmd>wq<CR>", { desc = "Save and quit" })

key("t", "<Esc><Esc>", [[<C-\><C-n>]])
key("n", "<leader>q", ":wqa<CR>", { silent = true })

vim.keymap.set("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.wo.linebreak = vim.wo.wrap -- Break at words, not characters

	-- Remap j/k to move by visual lines when wrapped, or reset to physical lines
	if vim.wo.wrap then
		vim.keymap.set("n", "j", "gj", { buffer = true })
		vim.keymap.set("n", "k", "gk", { buffer = true })
	else
		pcall(vim.keymap.del, "n", "j", { buffer = true })
		pcall(vim.keymap.del, "n", "k", { buffer = true })
	end
end, { desc = "Toggle Smart Word Wrap" })

-- -- Toggle text wrap for the current window
-- vim.keymap.set("n", "<leader>tw", function()
-- 	vim.wo.wrap = not vim.wo.wrap
-- 	print("Text wrap: " .. (vim.wo.wrap and "ENABLED" or "DISABLED"))
-- end, { desc = "Toggle text wrap" })
