return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'mason-org/mason.nvim', opts = {} },
		'mason-org/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		'saghen/blink.cmp',
	},
	config = function()
		local capabilities = require('blink.cmp').get_lsp_capabilities()
		local servers = {
			zk = {}, -- note taking system
			lua_ls = {},
			ts_ls = {
				root_dir = require("lspconfig").util.root_pattern({ "package.json",
					"tsconfig.json" }),
				single_file_support = false,
				settings = {},
			},
			gopls = {},
			tailwindcss = {},
			denols = {
				deno = {
					enable = true,
					root_dir = require("lspconfig").util.root_pattern({ "deno.json", "deno.jsonc" }),
					single_file_support = false,
					settings = {},
				}
			}
		}

		vim.lsp.config('denols', {
			settings = {
				deno = {
					enable = false,
					root_markers = { "deno.json", "deno.jsonc" },
					single_file_support = false,
				}
			}
		})
		vim.lsp.enable({ 'denols', 'ts_ls', 'zk', 'lua_ls', 'tailwindcss', 'gopls' })

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client:supports_method("textDocument/completion") then
					vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
				end
			end,
		})
		vim.cmd("set completeopt+=noselect")
	end,
}
