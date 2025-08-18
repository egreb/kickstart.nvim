return {
  'soulsam480/nvim-oxlint',
  opts = {
    root_dir = require('lspconfig').util.root_pattern('.git', '.oxlintrc.json'),
  },
}
