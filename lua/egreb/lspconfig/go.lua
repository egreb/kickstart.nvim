return {
  cmd = { 'gopls' },
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
    },
    gopls = {
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        unusedvariable = true,
      },
      staticcheck = true,
      completeUnimported = true,
      experimentalPostfixCompletions = true,
      usePlaceholders = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
