vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ Buffer ]]
-- vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = '[C]lose buffer' })
-- [[ Close buffers ]]
vim.keymap.set('n', '<S-q>', '<cmd>Bdelete!<CR>', { desc = '[C]lose [B]uffer' })
-- [[ Quit windows ]]
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = '[Q]uit [W]indow' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
