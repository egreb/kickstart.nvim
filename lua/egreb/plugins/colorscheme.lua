-- return { -- You can easily change to a different colorscheme.
--   -- Change the name of the colorscheme plugin below, and then
--   -- change the command in the config to whatever the name of that colorscheme is.
--   --
--   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   'folke/tokyonight.nvim',
--   priority = 1000, -- Make sure to load this before all the other start plugins.
--   init = function()
--     -- Load the colorscheme here.
--     -- Like many other themes, this one has different styles, and you could load
--     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--     vim.cmd.colorscheme 'tokyonight-night'
--
--     -- You can configure highlights by doing something like:
--     vim.cmd.hi 'Comment gui=none'
--   end,
-- }
-- return {
--   '0xstepit/flow.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require('flow').setup_options {
--       transparent = true, -- Set transparent background.
--       fluo_color = 'pink', --  Fluo color: pink, yellow, orange, or green.
--       mode = 'bright', -- Intensity of the palette: normal, dark, or bright. Notice that dark is ugly!
--       aggressive_spell = true, -- Display colors for spell check.
--     }
--
--     vim.cmd 'colorscheme flow'
--   end,
-- }
return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.o.background = 'dark'
    vim.g.gruvbox_material_background = 'medium'
    vim.cmd.colorscheme 'gruvbox-material'
  end,
}
