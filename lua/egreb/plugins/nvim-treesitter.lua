return {
	"nvim-treesitter/nvim-treesitter",
	version = "main",
	build = ":TSUpdate",
	config = function()
		require('nvim-treesitter.configs').setup {
			auto_install = true,
			ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"printf",
				"query",
				"regex",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
				"elixir",
				"heex",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true, -- optional: indentation powered by treesitter
			},
		}
	end,
}
