return {
	'saghen/blink.cmp',
	opts = {
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = 'mono'
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		completion = {
			accept = { auto_brackets = { enabled = false }, },
			documentation = { auto_show = true, auto_show_delay_ms = 250 },
			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
		}
	},
}
