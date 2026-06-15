local key = vim.keymap.set
vim.g.mapleader = " "

-- Search & Replace
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

key('n', '<leader>;', ':')
key('n', '<leader>nh', ':nohlsearch<CR>')
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
key("i", "ht", "<Esc>", { desc = "Escape to Normal Mode" })

key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')

key('t', '<Esc><Esc>', [[<C-\><C-n>]])


