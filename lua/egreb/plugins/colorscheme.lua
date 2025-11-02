-- lua/plugins/rose-pine.lua
return {
	'rose-pine/neovim',
	name = 'rose-pine',
	config = function()
		require('rose-pine').setup {
			variant = 'moon', -- auto, main, moon, or dawn
			dark_variant = 'moon', -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,
			highlight_groups = {
				Comment = {
					fg = '#f7f7f7',
				},
			},
		}

		vim.o.background = 'dark'
		vim.cmd 'colorscheme rose-pine'
	end,
}
