-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		style = "moon",
-- 		light_style = "day",
-- 		dim_inactive = true,
-- 		cache = true,
-- 	},
-- 	config = function()
-- 		vim.cmd [[colorscheme tokyonight]]
-- 	end
-- }
-- return {
-- 	'datsfilipe/vesper.nvim',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd [[colorscheme vesper]]
-- 	end
-- }
-- return {
-- 	'ellisonleao/gruvbox.nvim',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup {
-- 			dim_inactive = true,
-- 			contrast = 'hard',
-- 		}
-- 		vim.o.background = dark
-- 		vim.cmd [[colorscheme gruvbox]]
-- 	end
-- }
-- return {
-- 	'luisiacc/gruvbox-baby',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.gruvbox_baby_background_color = 'dark'
-- 		vim.o.background = dark
-- 		vim.cmd [[colorscheme gruvbox-baby]]
-- 	end
-- }
-- return {
-- 	'sainnhe/gruvbox-material',
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- Optionally configure and load the colorscheme
-- 		-- directly inside the plugin declaration.
-- 		vim.o.background = dark
-- 		vim.g.gruvbox_material_enable_italic = false
-- 		vim.g.gruvbox_material_contrast = 'dark'
-- 		vim.cmd.colorscheme('gruvbox-material')
-- 	end
-- }
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = false, -- disables setting the background color.
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false,     -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true,    -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = true,    -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.75, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false,     -- Force no italic
			no_bold = false,       -- Force no bold
			no_underline = false,  -- Force no underline
			styles = {             -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {},
			custom_highlights = {},
			default_integrations = true,
			auto_integrations = false,
			integrations = {
				cmp = true,
				treesitter = true,
				blink = true,
				blink_cmp = {
					style = 'bordered',
				},
				snacks = {
					enabled = true,
					indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
				}
			},
		})
		vim.cmd.colorscheme 'catppuccin'
	end,
}
