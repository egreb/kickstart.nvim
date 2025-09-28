return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'mason-org/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		{
			'saghen/blink.cmp',
			version = "1.*"
		},
	},
	config = function()
		vim.lsp.config('emmet_language_server', {
			settings = {
				cmd = { 'emmet-language-server', '--stdio' },
				filetypes = {
					'css',
					'html',
					'javascript',
					'javascriptreact',
					'typescript',
					'typescriptreact',
					'tmpl',
					'liquid',
				},
				init_options = {
					excludeLanguages = {},
					preferences = {},
					showAbbreviationSuggestions = true,
					showExpandedAbbreviation = 'always',
					showSuggestionsAsSnippets = true, -- important
					syntaxProfiles = {},
					variables = {},
				},
			}
		})
		vim.lsp.config('jsonls', {})

		vim.lsp.enable({ 'ts_ls', 'zk', 'lua_ls', 'tailwindcss', 'gopls', 'emmet_language_server', 'jsonls' })
		vim.cmd("set completeopt+=noselect")
	end,
}
