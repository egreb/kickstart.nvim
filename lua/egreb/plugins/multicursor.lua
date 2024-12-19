return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'

    mc.setup()
    local set = vim.keymap.set

    set({ 'n', 'v' }, '<up>', function()
      mc.lineAddCursor(-1)
    end)
    set({ 'n', 'v' }, '<down>', function()
      mc.lineAddCursor(1)
    end)
    set({ 'n', 'v' }, '<leader><up>', function()
      mc.lineSkipCursor(-1)
    end)
    set({ 'n', 'v' }, '<leader><down>', function()
      mc.lineSkipCursor(1)
    end)

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'v' }, '<leader>n', function()
      mc.matchAddCursor(1)
    end)
    set({ 'n', 'v' }, '<leader>s', function()
      mc.matchSkipCursor(1)
    end)
    set({ 'n', 'v' }, '<leader>N', function()
      mc.matchAddCursor(-1)
    end)
    set({ 'n', 'v' }, '<leader>S', function()
      mc.matchSkipCursor(-1)
    end)

    set('n', '<esc>', function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)
  end,
}
