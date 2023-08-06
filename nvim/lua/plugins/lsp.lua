return {
	{
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			vim.diagnostic.config({
				signs = false,
				virtual_text = {
					spacing = 3,
					prefix = "",
					format = function(diagnostic)
						if
							diagnostic.severity == vim.diagnostic.severity.ERROR
						then
							return string.format(
								"󰅚 %s (%s)",
								diagnostic.message,
								diagnostic.source
							)
						end
						if
							diagnostic.severity == vim.diagnostic.severity.WARN
						then
							return string.format(
								"󰀪 %s (%s)",
								diagnostic.message,
								diagnostic.source
							)
						end
						if
							diagnostic.severity == vim.diagnostic.severity.HINT
						then
							return string.format(
								"󰋽 %s (%s)",
								diagnostic.message,
								diagnostic.source
							)
						end
						if
							diagnostic.severity == vim.diagnostic.severity.INFO
						then
							return string.format(
								"󰌶 %s (%s)",
								diagnostic.message,
								diagnostic.source
							)
						end
					end,
				},
				severity_sort = false,
			})

			local lspconfig = require("lspconfig")

			for server, config in pairs(require("helpers.lsp_servers")) do
				config.capabilities =
					require("cmp_nvim_lsp").default_capabilities()
				lspconfig[server].setup(config)
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = vim.tbl_keys(require("helpers.lsp_servers")),
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				setup_jsonls = false,
			})
		end,
	},
}
