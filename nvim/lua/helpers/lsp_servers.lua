return {
	astro = {},
	bashls = {},
	cssls = {},
	dockerls = {},
	eslint = {},
	gopls = {},
	graphql = {},
	html = {},
	htmx = {},
	intelephense = {},
	jdtls = {},
	jsonls = {},
	lua_ls = {
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if
				not vim.loop.fs_stat(path .. "/.luarc.json")
				and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
			then
				client.config.settings =
					vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							library = { vim.env.VIMRUNTIME },
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
							-- library = vim.api.nvim_get_runtime_file("", true)
						},
					})

				client.notify(
					"workspace/didChangeConfiguration",
					{ settings = client.config.settings }
				)
			end
			return true
		end,
	},
	tailwindcss = {
		filetypes = {
			"aspnetcorerazor",
			"astro",
			"astro-markdown",
			"blade",
			"clojure",
			"django-html",
			"htmldjango",
			"edge",
			"eelixir",
			"elixir",
			"ejs",
			"erb",
			"eruby",
			"gohtml",
			"gohtmltmpl",
			"haml",
			"handlebars",
			"hbs",
			"html",
			"html-eex",
			"heex",
			"jade",
			"leaf",
			"liquid",
			"markdown",
			"mdx",
			"mustache",
			"njk",
			"nunjucks",
			"php",
			"razor",
			"slim",
			"twig",
			"css",
			"less",
			"postcss",
			"sass",
			"scss",
			"stylus",
			"sugarss",
			"javascript",
			"javascriptreact",
			"reason",
			"rescript",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
			"templ",
		},
		init_options = {
			userLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
				templ = "html",
			},
		},
	},
	templ = {},
	omnisharp = {},
	pyright = {},
	solargraph = {},
	marksman = {},
	rust_analyzer = {},
	sqlls = {},
	tsserver = {},
}
