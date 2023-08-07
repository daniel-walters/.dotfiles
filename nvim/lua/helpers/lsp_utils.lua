local M = {}

M.client_supports_formatting = function(client_id)
	local cli = vim.lsp.get_client_by_id(client_id)
	if not cli then
		return false
	end

	return cli.supports_method("textDocument/formatting")
end

return M
