local M = {}

M.current_theme = 'dark'

M.get_system_theme = function()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'

  if not handle then
    return 'dark'
  end

  local result = handle:read '*a'
  handle:close()

  if result:match 'Dark' then
    return 'dark'
  else
    return 'light'
  end
end

M.toggle = function()
  local theme = M.get_system_theme()
  if theme == M.current_theme then
    return
  end

  M.current_theme = theme
end

M.setup = function()
  local theme = M.get_system_theme()
  M.set_colorscheme(theme)
  M.current_theme = theme

  vim.api.nvim_create_autocmd('FocusGained', {
    callback = function()
      local new_theme = M.get_system_theme()
      M.set_colorscheme(new_theme)
      M.current_theme = new_theme
    end,
  })
end

M.set_colorscheme = function(theme)
  local variant = 'moon'
  if theme == 'light' then
    variant = 'dawn'
  end
  require('rose-pine').setup {
    variant = variant,
    styles = {
      italic = false,
    },
  }

  vim.o.background = theme
  vim.cmd 'colorscheme rose-pine'
end

return M
