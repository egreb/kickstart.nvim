return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>fb',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat [B]uffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 2000,
      async = false,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      css = { 'prettier' },
      json = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascriptreact = { 'prettier' },
      astro = { 'prettier' },
      go = { 'goimports', 'gofmt' },
    },
  },
}
