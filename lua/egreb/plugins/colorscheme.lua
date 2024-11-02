return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = true,
    compile_path = vim.fn.stdpath 'cache' .. '/tokyonight',
    compile = true,
    integrations = {
      cmp = true,
      treesitter = true,
      mason = true,
      native_lsp = {
        enabled = true,
        inlay_hints = {
          background = true,
        },
      },
      mini = {
        enabled = true,
        indentscope_color = 'lavender',
      },
    },
  },
  enabled = true,
  config = function()
    require('tokyonight').setup {}
    vim.cmd [[colorscheme tokyonight]]
  end,
}
