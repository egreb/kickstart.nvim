vim.keymap.set('n', '<leader>cu', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- clear current search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Show error message
vim.keymap.set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror [M]essages' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [E]rror [Q]uickfixlist' })

local map = vim.keymap.set

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bd', function()
	-- @Snacks
	Snacks.bufdelete()
end, { desc = 'Delete Buffer' })
map('n', '<leader>bo', function()
	Snacks.bufdelete.other()
end, { desc = 'Delete Other Buffers' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- multicursor keybindings
-- TODO: Make these better
map({ 'v', 'n' }, '<leader>lm', function()
	require('multicursor-nvim').fromVisual()
end)
map({ 'v', 'n' }, '<leader>la', function()
	require('multicursor-nvim').lineAddCursor(-1)
end)
map({ 'v', 'n' }, '<leader>lA', function()
	require('multicursor-nvim').lineAddCursor(1)
end)
map({ 'v', 'n' }, '<leader>ln', function()
	require('multicursor-nvim').matchAddCursor(1)
end)
map({ 'v', 'n' }, '<leader>lN', function()
	require('multicursor-nvim').matchAddCursor(-1)
end)
map({ 'v', 'n' }, '<leader>lS', function()
	require('multicursor-nvim').matchSkipCursor(-1)
end)
map({ 'v', 'n' }, '<leader>lq', function()
	local mc = require 'multicursor-nvim'
	if not mc.cursorsEnabled() then
		mc.enableCursors()
	elseif mc.hasCursors() then
		mc.clearCursors()
	else
		-- Default <esc> handler.
	end
end)

-- Picker keymaps
-- find files
map({ 'n' }, '<leader>ff', function()
	Snacks.picker.smart()
end, { desc = '[F]ind [F]iles' })
-- grep files
map({ 'n' }, '<leader>fg', function()
	Snacks.picker.grep()
end, { desc = '[G]rep [F]iles' })
-- resume previous search
map({ 'n' }, '<leader>fr', function()
	Snacks.picker.resume()
end, { desc = '[R]esume [S]earch' })

-- list buffers
map({ 'n' }, '<leader><leader>', function()
	Snacks.picker.buffers()
end, { desc = '[F]ind [B]uffers' })

-- search history
map({ 'n' }, '<leader>fh', function()
	Snacks.picker.search_history {
		cwd = '/',
	}
end, { desc = 'Search [H]istory' })
-- diagnostics
map({ 'n' }, '<leader>fd', function()
	Snacks.picker.diagnostics()
end, { desc = 'Find [D]iagnostic' })
-- old files
map({ 'n' }, '<leader>fo', function()
	Snacks.picker.recent {
		cwd = true,
	}
end, { desc = '[O]ld Files' })
-- search word under cursor
map({ 'n' }, '<leader>fw', function()
	Snacks.picker.grep_word()
end, { desc = 'Visual selection or word' })
