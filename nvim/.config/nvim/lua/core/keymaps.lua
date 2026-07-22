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
