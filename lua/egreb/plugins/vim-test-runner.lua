vim.g.VtrPercentage = 45
vim.g.VtrOrientation = 'h'
vim.g.vtr_filetype_runner_overrides = {
  go = 'go run {file}',
}

return {
  'christoomey/vim-tmux-runner',
  lazy = true,
  config = function()
    vim.keymap.set({ 'n' }, '<leader>td', function()
      vim.cmd 'VtrSendCtrlD'
    end)

    vim.keymap.set({ 'n' }, '<leader>tc', function()
      vim.cmd 'VtrSendCtrlC'
    end)

    vim.keymap.set({ 'n' }, '<leader>tr', function()
      require('custom.utils.mappings').feedkeys ':VtrSendCommandToRunner<Space>'
    end)

    vim.keymap.set({ 'n' }, '<leader>ta', function()
      require('custom.utils.mappings').feedkeys ':VtrAttach<Space>'
    end)

    vim.keymap.set({ 'n' }, '<leader>to', function()
      vim.cmd 'VtrOpenRunner'
    end)

    vim.keymap.set({ 'n' }, '<leader>tk', function()
      vim.cmd 'VtrKillRunner'
    end)

    vim.keymap.set({ 'n' }, '<leader>tf', function()
      vim.cmd 'VtrOpenRunner'
      vim.cmd 'VtrSendFile'
    end)

    vim.keymap.set({ 'n' }, '<leader>tl', function()
      vim.cmd 'VtrOpenRunner'
      vim.cmd 'VtrSendLinesToRunner'
    end)

    vim.keymap.set({ 'n' }, '<leader>tp', function()
      vim.cmd 'VtrOpenRunner'
      vim.cmd 'VtrSendCommandToRunner r'
    end)

    vim.keymap.set(
      { 'n' },
      '<leader>ts',
      require('custom.utils.mappings').with_textobject(function(start_position, end_position)
        vim.cmd(tostring(start_position[1]) .. ',' .. tostring(end_position[1]) .. ' ' .. 'VtrSendLinesToRunner')
      end)
    )

    vim.keymap.set({ 'v' }, '<leader>tl', function()
      require('custom.utils.visual').run_with_range 'VtrSendLinesToRunner'
    end)
    vim.cmd [[
  silent VtrAttachToPane 1"
  ]]
  end,
  -- keys = {
  --   "<leader>td",
  --   "<leader>tc",
  --   "<leader>tr",
  --   "<leader>ta",
  --   "<leader>to",
  --   "<leader>ts",
  --   "<leader>tk",
  --   "<leader>tf",
  --   "<leader>tl",
  --   "<leader>tp",
  --   "<leader>tl",
  -- },
}
