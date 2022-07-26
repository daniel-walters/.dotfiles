local Terminal = require("toggleterm.terminal").Terminal
local notes = Terminal:new({
	dir = "~/notes",
	cmd = "ls *.md | entr -c glow notes.md",
	direction = "vertical",
})

local function Notes()
	notes:toggle()
end

return {
	Notes = Notes,
}
