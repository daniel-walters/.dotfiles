local db = require("dashboard")
db.custom_center = {
	{
		icon = "  ",
		desc = "Find file                   ",
		action = "Telescope find_files",
		shortcut = "SPC f f   ",
	},
	{
		icon = "  ",
		desc = "Grep search                 ",
		action = "Telescope live_grep",
		shortcut = "SPC f w   ",
	},
	{
		icon = "ﯠ  ",
		desc = "Marks                       ",
		action = "lua require('harpoon.ui').toggle_quick_menu()",
		shortcut = "SPC m l   ",
	},
	{
		icon = "  ",
		desc = "Recent files                ",
		action = "Telescope oldfiles",
		shortcut = "SPC f o   ",
	},
	{
		icon = "  ",
		desc = "Pull Requests               ",
		action = "Octo pr list",
		shortcut = "SPC g h p",
	},
	{
		icon = "  ",
		desc = "Issues                      ",
		action = "Octo issue list",
		shortcut = "SPC g h i",
	},
	{
		icon = "  ",
		desc = "Assigned Issues/PRs         ",
		action = "Octo search assignee:@me is:open",
		shortcut = "SPC g h a",
	},
	{
		icon = "ﮒ  ",
		desc = "Review requested            ",
		action = "Octo search review-requested:@me is:open",
		shortcut = "SPC g h r",
	},
}

db.custom_footer = { "" }
