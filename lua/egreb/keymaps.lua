vim.keymap.set('n', '<leader>cu', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- file navigation
vim.keymap.set("n", "<leader>b", ":Oil<CR>", { desc = "File navigation" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- clear current search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
