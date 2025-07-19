return {
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          dim_inactive = true,
        },
      }
    end,
    dependencies = {
      {
        'afonsofrancof/OSC11.nvim',
        opts = {
          -- Function to call when switching to dark theme
          on_dark = function()
            vim.opt.background = 'dark'
            vim.cmd 'colorscheme nordfox'
          end,
          -- Function to call when switching to light theme
          on_light = function()
            vim.opt.background = 'light'
            vim.cmd 'colorscheme dayfox'
          end,
        },
      },
    },
  },
}
