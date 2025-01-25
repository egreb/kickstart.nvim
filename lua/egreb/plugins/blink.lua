return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      -- https://cmp.saghen.dev/configuration/completion.html
      completion = {
        menu = { border = 'single', auto_show = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = { border = 'single' },
        },
        trigger = {
          show_on_keyword = true,
        },
      },
      signature = { window = { border = 'single' } },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
  },
}
