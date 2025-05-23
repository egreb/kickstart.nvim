return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require('nvim-tree').setup {
      view = {
        side = 'right',
        width = 40,
      },
      update_focused_file = {
        enable = true,
      },
    }
    vim.keymap.set('n', '<leader>B', ':NvimTreeToggle<CR>', { noremap = true })
  end,
}
