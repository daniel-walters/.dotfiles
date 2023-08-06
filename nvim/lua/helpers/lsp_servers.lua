return {
	bashls = {},
	cssls = {},
	dockerls = {},
	eslint = {},
	gopls = {},
	graphql = {},
	html = {},
	jsonls = {},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	omnisharp = {},
	pyright = {},
	solargraph = {},
	remark_ls = {},
	rust_analyzer = {},
	sqlls = {},
	tsserver = {},
}
