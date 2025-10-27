return {
  'zenbones-theme/zenbones.nvim',
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones_darkness = 'stark'
    vim.g.zenbones_darken_comments = 0
    -- vim.cmd.colorscheme 'zenbones'
  end,
}
