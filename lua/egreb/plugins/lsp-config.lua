local servers = { 'ts_ls', 'zk', 'lua_ls', 'tailwindcss', 'gopls', 'emmet_language_server', 'jsonls' }
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

		vim.lsp.enable(servers)
		vim.cmd("set completeopt+=noselect")

		-- IMPORTANT: vim diagnostic configuration AFTER LSPs are loaded
		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config {
			severity_sort = true,
			float = { border = 'rounded', source = 'if_many' },
			underline = true,
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = '󰅚 ',
					[vim.diagnostic.severity.WARN] = '󰀪 ',
					[vim.diagnostic.severity.INFO] = '󰋽 ',
					[vim.diagnostic.severity.HINT] = '󰌶 ',
				},
			} or {},
			virtual_text = {
				source = 'if_many',
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		}

		-- Define a highlight group with only underline
		vim.api.nvim_set_hl(0, "DiagnosticLineUnderline", { underline = true, sp = "#3f0000" })
	end,
}
