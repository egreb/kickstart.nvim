return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        style = 'night',
        dim_inactive = true,
      }
    end,
    dependencies = {
      {
        'afonsofrancof/OSC11.nvim',
        opts = {
          -- Function to call when switching to dark theme
          on_dark = function()
            vim.opt.background = 'dark'
            vim.cmd 'colorscheme tokyonight-night'
          end,
          -- Function to call when switching to light theme
          on_light = function()
            vim.opt.background = 'light'
            vim.cmd 'colorscheme tokyonight-day'
          end,
        },
      },
    },
  },
}
-- return {
--   'fenetikm/falcon',
--   priority = 1000,
--   config = function()
--     vim.cmd 'colorscheme falcon'
--   end,
-- }
