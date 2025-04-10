return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  ft = { 'markdown', 'markdown-inline' },
  config = function()
    local preset = require('markview.presets').headings
    require('markview').setup {
      markdown = { tables = preset.single },
    }
  end,
}
