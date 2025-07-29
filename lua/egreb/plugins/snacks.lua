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
    -- Picker keymaps
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Buffers',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep {
          exclude = { 'node_modules/' },
          regex = false,
        }
      end,
      desc = 'Grep',
    },
    {
      '<c-P>',
      function()
        Snacks.picker.files {
          exclude = { 'node_modules' },
          hidden = true,
        }
      end,
      desc = 'Find Files',
    },
    {
      '<leader>s.',
      function()
        Snacks.picker.recent {
          filter = {
            cwd = true,
          },
          hidden = true,
        }
      end,
      desc = 'Recent',
    },
    {
      '<leader>sr"',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      nowait = true,
      desc = 'Grep Word',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
    -- {
    --   '<leader>sc',
    --   function()
    --     Snacks.picker.resume()
    --   end,
    --   desc = 'Resume',
    -- },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics {
          filter = {
            cwd = true,
          },
        }
      end,
      desc = 'Workspace Diagnostics',
    },
  },
  opts = {
    input = {
      enabled = true,
      icon = ' ',
      icon_hl = 'SnacksInputIcon',
      icon_pos = 'left',
      prompt_pos = 'title',
      win = { style = 'input' },
      expand = true,
    },
    picker = {
      sources = {},
      prompt = ' ',
      ui_select = true,
      layout = {
        cycle = true,
        preset = function()
          return vim.o.columns >= 120 and 'default' or 'vertical'
        end,
      },
      formatters = {
        file = {
          filename_first = true, -- display filename before the file path
          truncate = 120,
        },
      },
    },
    notifier = { enabled = false },
    statuscolumn = { enabled = true },
    scratch = { enabled = true },
    lazygit = {
      enabled = true,
      configure = true,
      win = {
        style = 'lazygit',
      },
      selectedLineBgColor = { bg = '#333' },
    },
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
    bufdelete = {},
  },
}
