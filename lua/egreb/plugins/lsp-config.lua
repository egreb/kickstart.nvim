local servers = {
	'ts_ls',
	'zk',
	'lua_ls',
	'tailwindcss',
	'emmet_language_server',
	'jsonls',
	'gopls',
	'elixirls'
}
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
		vim.lsp.config('gopls', {
			settings = {
				Lua = {
					completion = {
						callSnippet = 'Replace',
					},
				},
				gopls = {
					analyses = {
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
						unusedvariable = true,
					},
					staticcheck = true,
					completeUnimported = true,
					experimentalPostfixCompletions = true,
					usePlaceholders = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
			},
		})

		vim.lsp.config('jsonls', {}) -- not sure why i need this
		vim.lsp.config('elixirls', {
			cmd = { vim.fn.stdpath("data") .. "/mason/packages/elixir-ls/language_server.sh" },
			root_dir = function(bufnr, on_dir)
				local fname = vim.api.nvim_buf_get_name(bufnr)
				--- Elixir workspaces may have multiple `mix.exs` files, for an "umbrella" layout or monorepo.
				--- So we specify `limit=2` and treat the highest one (if any) as the root of an umbrella app.
				local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
				local child_or_root_path, maybe_umbrella_path = unpack(matches)
				local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)
				print(root_dir)
				on_dir(root_dir)
			end,
			filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
			settings = {
			}
		})

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
