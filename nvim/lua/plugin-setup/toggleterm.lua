require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.50
		end
	end,
	persist_size = false,
	direction = "vertical",
	open_mapping = [[<C-\>]],
	shell = vim.o.shell,
})
