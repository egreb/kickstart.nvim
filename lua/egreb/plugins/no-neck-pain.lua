return {
  'shortcuts/no-neck-pain.nvim',
  version = '*',
  config = function()
    require('no-neck-pain').setup {
      mappings = {
        enabled = true,
        toggle = '<Leader>np',
      },
    }
  end,
}
