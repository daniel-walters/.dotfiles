local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "double",
	},
})

local function LazyGit()
	lazygit:toggle()
end

return {
	LazyGit = LazyGit,
}
