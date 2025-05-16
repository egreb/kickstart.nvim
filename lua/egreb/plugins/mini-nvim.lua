return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  name = 'mini',
  version = false,
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.icons').setup()
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
    require('mini.indentscope').setup()
    require('mini.move').setup()
    require('mini.statusline').setup {
      content = {
        active = function()
          return MiniStatusline.section_filename { trunc_width = 120 }
        end,
        inactive = function()
          return MiniStatusline.section_filename { trunc_width = 120 }
        end,
      },
    }
  end,
}
