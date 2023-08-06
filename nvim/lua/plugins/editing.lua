return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		keys = {
			{ "gc", mode = { "n", "v" } },
			{ "gb", mode = { "n", "v" } },
		},
		config = function()
			require("Comment").setup({
				pre_hook = require(
					"ts_context_commentstring.integrations.comment_nvim"
				).create_pre_hook(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
}
