return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    local toggle_opts = {
      title = ' Harpoon ',
      title_pos = 'center',
      ui_max_width = 80,
      ui_width_ratio = 1,
    }

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Append file to list' })
    -- vim.keymap.set('n', '<C-e>', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts)
    -- end, { desc = 'Toggle list' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-A-P>', function()
      harpoon:list():prev()
    end, { desc = 'Previous in list' })
    vim.keymap.set('n', '<C-A-N>', function()
      harpoon:list():next()
    end, { desc = 'Next in list' })
  end,
}
