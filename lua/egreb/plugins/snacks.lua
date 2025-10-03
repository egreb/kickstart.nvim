return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
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
				-- fullscreen = true,
				cycle = true,
				-- preset = 'center',
				-- preset = function()
				-- 	return 'vertical'
				-- end,
			},
			formatters = {
				file = {
					filename_first = true, -- display filename before the file path
					truncate = 120,
				},
			},
		},
		scratch = { enabled = true },
		lazygit = {
			enabled = true,
			configure = true,
			win = {
				style = 'lazygit',
			},
			selectedLineBgColor = { bg = '#333' },
		},
		gitbrowse = { enabled = true },
		bufdelete = {},
	},
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
					finder = 'grep',
					exclude = { 'node_modules/' },
					regex = true,
					hidden = true,
					layout = {
						fullscreen = true,
						preset = 'vertical',
					},
				}
			end,
			desc = 'Grep',
		},
		{
			'<leader>sf',
			function()
				Snacks.picker.files {
					exclude = { 'node_modules' },
					hidden = true,
					layout = {
						fullscreen = true,
						preset = 'vertical',
					},
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
		{
			'<leader>sc',
			function()
				Snacks.picker.resume()
			end,
			desc = 'Resume',
		},
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
		{ "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
		{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		{ "<leader>gr", function() Snacks.picker.lsp_references() end,        nowait = true,                 desc = "References" },
	}
}
