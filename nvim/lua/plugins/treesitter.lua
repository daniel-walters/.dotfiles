return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"astro",
					"bash",
					"c_sharp",
					"css",
					"diff",
					"dockerfile",
					"go",
					"graphql",
					"html",
					"java",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"php",
					"python",
					"regex",
					"ruby",
					"rust",
					"scss",
					"sql",
					"templ",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				autotag = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
				matchup = {
					enable = true,
					disable_virtual_text = true,
				},
			})

			---@diagnostic disable-next-line: missing-fields
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
}
