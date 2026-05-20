local key = vim.keymap.set
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status (Fugitive)" })
vim.g.mapleader = " "

-- UndoTree: Map to plugin command
key("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Oil: Edit filesystem
key("n", "-", "<cmd>Oil<cr>")

-- Telescope: Live Grep (Requires ripgrep: sudo pacman -S ripgrep)
key("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- LSP: Smart Rename
key("n", "<leader>rn", vim.lsp.buf.rename)

-- Markdown Preview
key("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>")

-- Search & Replace
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Run Code
key('n', '<leader>r', function()
local ft = vim.bo.filetype
local cmd = ""
if ft == "python" then cmd = "python3 " .. vim.fn.expand("%")
    elseif ft == "c" then cmd = "gcc " .. vim.fn.expand("%") .. " -o out && ./out"
        elseif ft == "sh" then cmd = "bash " .. vim.fn.expand("%")
            elseif ft == "lua" then vim.cmd("source %") return end

                if cmd ~= "" then
                    vim.cmd("split | term " .. cmd)
                    vim.cmd("resize 10")
                    vim.cmd("startinsert")
                    end
                    end)

-- Core Nav
key('n', '<leader>e', '<cmd>Neotree toggle reveal<cr>')
key('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
key("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>")
key('n', '<leader>;', ':')
key('n', '<leader>nh', ':nohlsearch<CR>')
key('n', '<C-h>', '<C-w>h')
key('n', '<C-j>', '<C-w>j')
key('n', '<C-k>', '<C-w>k')
key('n', '<C-l>', '<C-w>l')
key("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Escape Insert
--Remaped caps lock to esc so no need 

--key("i", "jk", "<Esc>", { desc = "Escape to Normal Mode" })
key('t', '<Esc><Esc>', [[<C-\><C-n>]])
