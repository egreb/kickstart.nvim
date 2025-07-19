-- Optional: Additional Markdown-specific settings
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.wo.conceallevel = 2 -- Conceal certain Markdown syntax
vim.wo.concealcursor = 'nc' -- Conceal in normal and command mode

-- Create buffer autocommand to restore dark mode when leaving markdown buffers
local group = vim.api.nvim_create_augroup('MarkdownColorschemeRestore', { clear = true })

vim.api.nvim_create_autocmd('BufLeave', {
  group = group,
  buffer = 0, -- current buffer only
  callback = function()
    -- Only restore if we're switching to a non-markdown buffer
    vim.defer_fn(function()
      if vim.bo.filetype ~= 'markdown' then
        require('rose-pine').setup {
          variant = 'moon',
        }
        vim.cmd.colorscheme 'rose-pine'
      end
    end, 10) -- Small delay to ensure filetype is detected
  end,
})
