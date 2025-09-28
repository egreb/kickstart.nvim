vim.keymap.set('n', '<leader>cu', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- clear current search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Show error message
vim.keymap.set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror [M]essages' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [E]rror [Q]uickfixlist' })
