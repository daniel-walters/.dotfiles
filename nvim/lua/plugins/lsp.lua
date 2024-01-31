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
			vim.filetype.add({
				extension = {
					templ = "templ",
				},
			})

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
	{
		"nvimtools/none-ls.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local null_ls = require("null-ls")

			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					filter = function(client)
						-- apply whatever logic you want (in this example, we'll only use null-ls)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end

			-- if you want to set up formatting on save, you can use this as a callback
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- add to your shared on_attach callback
			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier.with({
						extra_filetypes = { "astro", "html" },
					}),
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofmt,
				},
				on_attach = on_attach,
			})
		end,
	},
}
