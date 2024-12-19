return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<leader>nn',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>ns',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    {
      '<leader>lg',
      function(opts)
        Snacks.lazygit.open(opts)
      end,
      desc = '[L]azy[G]it',
    },
    {
      '<leader>gb',
      function(opts)
        Snacks.git.blame_line(opts)
      end,
      '[G]it [B]lame',
    },
    {
      '<leader>go',
      function(opts)
        Snacks.gitbrowse.open(opts)
      end,
      '[G]it [B]lame',
    },
    {
      '<leader>tt',
      function(opts)
        vim.o.shell = '/opt/homebrew/bin/fish'
        Snacks.terminal.toggle(_, opts)
      end,
      '[T]oggle [T]erminal',
    },
  },
  opts = {
    notifier = { enabled = true },
    statuscolumn = { enabled = true },
    scratch = { enabled = true },
    lazygit = { enabled = true },
    git = {
      width = 0.6,
      height = 0.6,
      border = 'rounded',
      title = ' Git Blame ',
      title_pos = 'center',
      ft = 'git',
    },
    gitbrowse = { enabled = true },
    -- win = { style = 'terminal', position = 'bottom' },
    terminal = {
      enabled = true,
      keys = {
        q = 'hide',
        term_normal = {
          '<esc>',
          function(self)
            self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
            if self.esc_timer:is_active() then
              self.esc_timer:stop()
              vim.cmd 'stopinsert'
            else
              self.esc_timer:start(200, 0, function() end)
              return '<esc>'
            end
          end,
          mode = 't',
          expr = true,
          desc = 'Double escape to normal mode',
        },
      },
    },
  },
}
