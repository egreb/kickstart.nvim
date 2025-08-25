return { -- Autoformat
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			'<leader>f',
			function()
				require('conform').format { async = true, lsp_format = 'fallback' }
			end,
			mode = '',
			desc = '[F]ormat buffer',
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = 'fallback',
				}
			end
		end,
		formatters_by_ft = {
			css = { 'prettier' },
			json = { 'prettier' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			javascriptreact = { 'prettier' },
			go = { 'goimports', 'gofmt' },
			yaml = { 'prettier' },
			yml = { 'prettier' },
		},
		-- config = function(_, opts)
		-- 	require("conform").setup(opts)
		--
		-- 	-- Dynamic formatter selection
		-- 	local original_formatters_by_ft = vim.deepcopy(opts.formatters_by_ft or {})
		--
		-- 	-- Override JavaScript/TypeScript formatters based on project type
		-- 	local function update_formatters()
		-- 		local util = require("conform.util")
		-- 		local root_files = { "deno.json", "deno.jsonc", "package.json" }
		-- 		local root_dir = util.root_file(root_files)
		--
		-- 		local is_deno_project = root_dir and
		-- 		    (vim.fn.filereadable(root_dir .. "/deno.json") == 1 or vim.fn.filereadable(root_dir .. "/deno.jsonc") == 1)
		--
		-- 		local formatters_by_ft = vim.deepcopy(original_formatters_by_ft)
		--
		-- 		if is_deno_project then
		-- 			formatters_by_ft.typescript = { "deno_fmt" }
		-- 			formatters_by_ft.javascript = { "deno_fmt" }
		-- 			formatters_by_ft.typescriptreact = { "deno_fmt" }
		-- 			formatters_by_ft.javascriptreact = { "deno_fmt" }
		-- 		else
		-- 			formatters_by_ft.typescript = { "prettierd" }
		-- 			formatters_by_ft.javascript = { "prettierd" }
		-- 			formatters_by_ft.typescriptreact = { "prettierd" }
		-- 			formatters_by_ft.javascriptreact = { "prettierd" }
		-- 		end
		--
		-- 		require("conform").formatters_by_ft = formatters_by_ft
		-- 	end
		--
		-- 	-- Update formatters when opening a new buffer or changing directories
		-- 	vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
		-- 		callback = update_formatters,
		-- 	})
		--
		-- 	-- Initial update
		-- 	update_formatters()
		-- end,
	},
}
