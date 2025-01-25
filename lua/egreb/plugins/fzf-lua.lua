-- This is only used with zk/note system
return {
  'ibhagwan/fzf-lua',
  enabled = true,
  -- only used for the notes system atm
  ft = 'markdown',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {
      defaults = {
        file_icons = 'mini',
        copen = 'topright copen',
        cwd_header = true,
      },
      oldfiles = {
        cwd_only = true,
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept',
        },
      },
    }

    -- local fzf = require 'fzf-lua'
    --
    -- -- find files
    -- vim.keymap.set('n', '<c-P>', function()
    --   fzf.files()
    -- end, { desc = 'find files' })
    -- -- resume search
    -- vim.keymap.set('n', '<leader>sr', function()
    --   fzf.resume()
    -- end, { desc = 'resume search' })
    -- -- oldfiles
    -- vim.keymap.set('n', '<leader>s.', function()
    --   fzf.oldfiles()
    -- end, { desc = '[S]earch Recent Files ("." for repeat)' })
    -- -- buffers
    -- vim.keymap.set('n', '<leader><leader>', fzf.buffers, { desc = 'old files' })
    -- -- grep
    -- vim.keymap.set('n', '<leader>sg', fzf.live_grep, { desc = 'live grep' })
    -- -- grep word under cursor
    -- vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'search for word under cursor' })
    -- -- grep current buffer
    -- vim.keymap.set('n', '<leader>/', fzf.lgrep_curbuf, { desc = 'grep current buffer' })
  end,
}
