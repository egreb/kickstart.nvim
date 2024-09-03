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
  settings = {
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
