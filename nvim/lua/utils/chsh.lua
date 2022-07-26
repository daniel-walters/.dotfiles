local Terminal = require("toggleterm.terminal").Terminal
local chsh = Terminal:new({
	cmd = "ch.sh",
	direction = "vertical",
})

local function ch()
	chsh:toggle()
end

return {
	ch = ch,
}
