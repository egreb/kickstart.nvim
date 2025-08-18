-- return {
--   {
--     'olimorris/onedarkpro.nvim',
--     priority = 1000,
--     config = function()
--       require('onedarkpro').setup {
--         options = {
--           highlight_inactive_windows = false,
--         },
--       }
--     end,
--     dependencies = {
--       {
--         'afonsofrancof/OSC11.nvim',
--         opts = {
--           -- Function to call when switching to dark theme
--           on_dark = function()
--             vim.opt.background = 'dark'
--             vim.cmd 'colorscheme onedark'
--           end,
--           -- Function to call when switching to light theme
--           on_light = function()
--             vim.opt.background = 'light'
--             vim.cmd 'colorscheme onelight'
--           end,
--         },
--       },
--     },
--   },
-- }
return {
  'fenetikm/falcon',
  priority = 1000,
  config = function()
    vim.cmd 'colorscheme falcon'
  end,
}
