require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"graphql",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"markdown",
		"python",
		"regex",
		"rust",
		"scss",
		"sql",
		"tsx",
		"typescript",
		"vim",
	},
	auto_install = true,
	context_commentstring = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
})
