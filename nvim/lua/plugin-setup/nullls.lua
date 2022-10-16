local null = require("null-ls")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

null.setup({
	sources = {
		null.builtins.code_actions.eslint,
		null.builtins.diagnostics.eslint,
		null.builtins.formatting.prettier,
		null.builtins.formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
		null.builtins.formatting.stylua,
	},
	on_attach = on_attach,
})
