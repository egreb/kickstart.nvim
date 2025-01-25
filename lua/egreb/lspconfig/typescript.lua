local lspconfig = require 'lspconfig'
return {
  -- root_dir = function(...)
  --   return require('lspconfig.util').root_pattern 'tsconfig.json' (...)
  -- end,
  cmd = { 'typescript-language-server', '--stdio' },
  root_dir = lspconfig.util.root_pattern('.git', 'package.json', 'tsconfig.json', 'jsconfig.json'),
  single_file_support = true,
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
    -- typescript = {
    --   inlayHints = {
    --     includeInlayParameterNameHints = 'literal',
    --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --     includeInlayFunctionParameterTypeHints = true,
    --     includeInlayVariableTypeHints = false,
    --     includeInlayPropertyDeclarationTypeHints = true,
    --     includeInlayFunctionLikeReturnTypeHints = true,
    --     includeInlayEnumMemberValueHints = true,
    --   },
    -- },
    -- javascript = {
    --   inlayHints = {
    --     includeInlayParameterNameHints = 'all',
    --     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --     includeInlayFunctionParameterTypeHints = true,
    --     includeInlayVariableTypeHints = true,
    --     includeInlayPropertyDeclarationTypeHints = true,
    --     includeInlayFunctionLikeReturnTypeHints = true,
    --     includeInlayEnumMemberValueHints = true,
    --   },
    -- },
  },
  init_options = {
    plugins = {
      {
        name = 'bun',
        location = vim.fn.expand '$HOME/.bun',
        enable = true,
      },
    },
  },
}
