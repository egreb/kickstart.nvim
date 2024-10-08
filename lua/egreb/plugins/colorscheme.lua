return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  enabled = false,
  config = function()
    vim.cmd [[colorscheme tokyonight]]
  end,
}
