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
		require('mini.ai').setup()

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require('mini.surround').setup()
		require('mini.indentscope').setup()
		require('mini.move').setup()
		require('mini.pick').setup()
		require('mini.pairs').setup {}
		require('mini.extra').setup {}

		local use_cterm, palette

		--base00 - Default Background
		--base01 - Lighter Background (Used for status bars, line number and folding marks)
		--base02 - Selection Background
		--base03 - Comments, Invisibles, Line Highlighting
		--base04 - Dark Foreground (Used for status bars)
		--base05 - Default Foreground, Caret, Delimiters, Operators
		--base06 - Light Foreground (Not often used)
		--base07 - Light Background (Not often used)
		--base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
		--base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
		--base0A - Classes, Markup Bold, Search Text Background
		--base0B - Strings, Inherited Class, Markup Code, Diff Inserted
		--base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
		--base0D - Functions, Methods, Attribute IDs, Headings
		--base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
		--base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

		palette = {
			base00 = '#0b0f10', -- Default Background (cool dark, not brown)
			base01 = '#12181a', -- Lighter Background (status line, gutters)
			base02 = '#1a2224', -- Selection / subtle highlight
			base03 = '#dfdf8e', -- Comments (highlighted)
			base04 = '#708b8d', -- Punctuation / muted
			base05 = '#cecece', -- Default Foreground
			base06 = '#8ebeec', -- Light Foreground / hints
			base07 = '#ffffff', -- Light Background (rarely used)

			base08 = '#cecece', -- Variables, Diff Deleted
			base09 = '#cd974b', -- Constants, Numbers
			base0A = '#dfdf8e', -- Classes / Bold
			base0B = '#95cb82', -- Strings, Diff Inserted
			base0C = '#47bea9', -- Support, Regex
			base0D = '#71aed7', -- Functions, Headings
			base0E = '#cc8bc9', -- Keywords, Diff Changed
			base0F = '#c33c33', -- Deprecated, Embedded Tags
		}

		if palette then
			require('mini.base16').setup { palette = palette, use_cterm = use_cterm }
			vim.g.colors_name = 'base16-alabaster'
		end
	end,
}
