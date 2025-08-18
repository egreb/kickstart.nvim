return {
  'vim-test/vim-test',
  enabled = false,
  lazy = true,
  dependencies = {
    'christoomey/vim-tmux-runner',
  },
  config = function()
    vim.cmd [[
let test#python#project_root = "./tests"
let test#strategy = "vtr"

let test#go#gotest#options = "-cover"
]]

    -- vim.keymap.set({ 'n' }, '<leader>dn', '<cmd>TestNearest<cr>')
    -- vim.keymap.set({ 'n' }, '<leader>df', '<cmd>TestFile<cr>')
    -- vim.keymap.set({ 'n' }, '<leader>ds', '<cmd>TestSuite<cr>')
    -- vim.keymap.set({ 'n' }, '<leader>dp', '<cmd>TestLast<cr>')
    -- vim.keymap.set({ 'n' }, '<leader>dv', '<cmd>TestVisit<cr>')
  end,
  -- keys = {
  --   '<leader>dn',
  --   '<leader>df',
  --   '<leader>ds',
  --   '<leader>dp',
  --   '<leader>dv',
  -- },
}
