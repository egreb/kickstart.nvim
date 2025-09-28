-- set leader to <space>
vim.g.mapleader        = ' '
vim.g.maplocalleader   = ' '

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.swapfile       = false
vim.opt.wrap           = false
vim.opt.signcolumn     = 'yes'
vim.opt.winborder      = 'rounded'
vim.opt.smartindent    = true
vim.opt.termguicolors  = true
vim.opt.ignorecase     = true
vim.opt.cursorcolumn   = false
vim.opt.cursorline     = true
vim.opt.undofile       = true
vim.g.have_nerd_font   = true

-- Decrease update time
vim.opt.updatetime     = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen     = 300

-- Don't show the mode, since it's already in the status line
vim.opt.showmode       = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard      = 'unnamedplus'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff        = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm          = true
vim.opt.smoothscroll   = true
vim.opt.foldexpr       = "v:lua.require'lazyvim.util'.ui.foldexpr()"
vim.opt.foldtext       = ""
-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = vim.diagnostic.severity.ERROR },
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
