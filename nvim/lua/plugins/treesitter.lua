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
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
			})
		end,
	},
}
