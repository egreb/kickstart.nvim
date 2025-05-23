return {
  cmd = { 'biome', 'lsp-proxy' },
  root_dir = function(fname)
    local util = require 'lspconfig.util'
    local has_biome = util.root_pattern('biome.json', 'biome.jsonc')(fname)

    if has_biome then
      return has_biome
    end

    return nil -- prevent LSP from starting
  end,
}
