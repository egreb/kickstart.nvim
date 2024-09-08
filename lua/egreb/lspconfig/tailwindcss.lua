return {
  filetypes = {
    'templ',
    'html',
    'ts',
    'tsx',
    'js',
    'typescript',
    'typescriptreact',
    'javascript',
    'javascriptreact',
    'astro',
  },
  init_options = {
    userLanguages = {
      templ = 'html',
    },
  },
  root_dir = require('lspconfig.util').root_pattern(
    'tailwind.config.js',
    'tailwind.config.cjs',
    'tailwind.config.mjs',
    'tailwind.config.ts',
    'postcss.config.js',
    'postcss.config.cjs',
    'postcss.config.mjs',
    'postcss.config.ts',
    'package.json',
    'node_modules',
    '.git'
  ),
  settings = {
    validate = true,
    lint = {
      cssConflict = 'warning',
      invalidApply = 'error',
      invalidConfigPath = 'error',
      invalidScreen = 'error',
      invalidTailwindDirective = 'error',
      invalidVariant = 'error',
      recommendedVariantOrder = 'warning',
    },
    tailwindCSS = {
      classAttributes = {
        'class',
        'className',
        'classNames',
        'class:list',
        'classList',
        'ngClass',
        '.*Styles*',
        '.*ClassName*',
      },
      experimental = {
        classRegex = {
          { "(?:\\w+)?[cC]lassName\\s*=\\s*'([^']*)'", "([^\\s']+)" },
          { '(?:\\w+)?[cC]lassName\\s*=\\s*(["\'])([^"\']+)\\1', '([^\\s"\']+)' },
        },
      },
    },
  },
}
