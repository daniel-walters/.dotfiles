return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader>ff",
				":Telescope find_files<CR>",
				silent = true,
			},
			{
				"<leader>fg",
				":Telescope live_grep<CR>",
				silent = true,
			},
			{
				"<leader>fh",
				":Telescope oldfiles<CR>",
				silent = true,
			},
			{
				"gd",
				":Telescope lsp_definitions<CR>",
				silent = true,
			},
			{
				"gr",
				":Telescope lsp_references<CR>",
				silent = true,
			},
			{
				"gt",
				":Telescope lsp_type_definitions<CR>",
				silent = true,
			},
		},
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules", "^.git" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "Oil",
		keys = {
			{
				"<leader>fe",
				":Oil<CR>",
				silent = true,
			},
		},
		opts = {
			keymaps = {
				["<C-v>"] = "actions.select_vsplit",
				["<C-x>"] = "actions.select_split",
				["q"] = "actions.close",
			},
			view_options = {
				show_hidden = true,
			},
		},
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {
			global_settings = {
				mark_branch = true,
			},
		},
		keys = {
			{
				"<leader>mm",
				":lua require('harpoon.mark').add_file()<CR>",
				silent = true,
			},
			{
				"<leader>ml",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				silent = true,
			},
			{
				"<leader>1",
				":lua require('harpoon.ui').nav_file(1)<CR>",
				silent = true,
			},
			{
				"<leader>2",
				":lua require('harpoon.ui').nav_file(2)<CR>",
				silent = true,
			},
			{
				"<leader>3",
				":lua require('harpoon.ui').nav_file(3)<CR>",
				silent = true,
			},
			{
				"<leader>4",
				":lua require('harpoon.ui').nav_file(4)<CR>",
				silent = true,
			},
			{
				"<leader>5",
				":lua require('harpoon.ui').nav_file(5)<CR>",
				silent = true,
			},
			{
				"<leader>6",
				":lua require('harpoon.ui').nav_file(6)<CR>",
				silent = true,
			},
			{
				"<leader>7",
				":lua require('harpoon.ui').nav_file(7)<CR>",
				silent = true,
			},
			{
				"<leader>8",
				":lua require('harpoon.ui').nav_file(8)<CR>",
				silent = true,
			},
			{
				"<leader>9",
				":lua require('harpoon.ui').nav_file(9)<CR>",
				silent = true,
			},
		},
	},
	{
		"folke/flash.nvim",
		opts = {
			incremental = true,
		},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
			},
			"f",
			"F",
			"t",
			"T",
			"/",
			"?",
		},
	},
	{
		"andymass/vim-matchup",
		event = "VeryLazy",
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			local prettier_ft = {
				"astro",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"javacsriptreact",
				"typescriptreact",
			}

			local function clang()
				local clang_config =
					require("formatter.filetypes.java").clangformat()
				clang_config.args = {
					'-style="{BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 80}"',
					"-assume-filename=.java",
				}

				return clang_config
			end

			local filetype = {
				lua = { require("formatter.filetypes.lua").stylua },
				python = { require("formatter.filetypes.python").black },
				java = { clang },
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			}

			for _, value in pairs(prettier_ft) do
				filetype[value] = { require("formatter.defaults").prettierd }
			end

			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = filetype,
			})

			vim.api.nvim_create_autocmd("BufWritePost", {
				callback = function()
					if filetype[vim.bo.filetype] ~= nil then
						vim.cmd("FormatWrite")
					elseif #vim.lsp.get_active_clients() > 0 then
						local cli = vim.lsp.get_active_clients()[1]
						if
							cli
							and require("helpers.lsp_utils").client_supports_formatting(
								cli.id
							)
						then
							vim.lsp.buf.format()
						end
					else
						print(
							"Formatter not set for this ft and LSP cannot format"
						)
					end
				end,
			})
		end,
	},
	{
		"luckasRanarison/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = {
			"DevdocsInstall",
			"DevdocsUpdate",
			"DevdocsUpdateAll",
			"DevdocsOpen",
			"DevdocsUninstall",
		},
		opts = {},
	},
}
