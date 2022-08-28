local lspconfig = require("lspconfig")

vim.diagnostic.config({
	signs = false,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
		spacing = 3,
		prefix = "",
		format = function(diagnostic)
			if diagnostic.severity == vim.diagnostic.severity.ERROR then
				return string.format(" %s (%s)", diagnostic.message, diagnostic.source)
			end
			if diagnostic.severity == vim.diagnostic.severity.WARN then
				return string.format(" %s (%s)", diagnostic.message, diagnostic.source)
			end
			if diagnostic.severity == vim.diagnostic.severity.HINT then
				return string.format(" %s (%s)", diagnostic.message, diagnostic.source)
			end
			if diagnostic.severity == vim.diagnostic.severity.INFO then
				return string.format(" %s (%s)", diagnostic.message, diagnostic.source)
			end
		end,
	},
	severity_sort = true,
})

require("nvim-lsp-installer").setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local servers = {
	"bashls", -- Bash
	"cssls", -- CSS
	"dockerls", -- Docker
	"graphql", -- GraphQL
	"html", -- HTML
	"jsonls", -- JSON
	"tsserver", -- JS/TS
	"rust_analyzer", -- Rust
	"sumneko_lua", -- LUA
	"pyright", -- Python
	"sqlls", -- SQL
}

local function on_attach(client, bufnr)
	require("illuminate").on_attach(client)
	require("lsp_signature").on_attach({
		bind = true,
		hint_enable = false,
		handler_opts = {
			border = "rounded",
		},
		toggle_key = "<C-`>",
		zindex = 50,
	}, bufnr)
	client.resolved_capabilities.document_formatting = false
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if server == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		}
	end
	lspconfig[server].setup(opts)
end
