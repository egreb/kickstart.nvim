return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 80,
        max_height = 40,
        border = 'rounded',
      },
    }

    -- [[ OIL ]]
    vim.keymap.set('n', '<leader>b', ':Oil --float<CR>', { noremap = true })
  end,
}
