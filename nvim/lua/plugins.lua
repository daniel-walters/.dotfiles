------ PACKER COMMANDS ------
-- Regenerate compiled loader file
--  :PackerCompile

-- Remove any disabled or unused plugins
--  :PackerClean

-- Clean, then install missing plugins
--  :PackerInstall

-- Clean, then update and install plugins
--  :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
--  :PackerSync
-----------------------------

-- Automotically run :PackerCompile when this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Require configuration file
local function get_config(filename)
	return string.format('require("plugin-setup/%s")', filename)
end

local use = require("packer").use

-- Plugins
return require("packer").startup(function()
	------------------------
	------- Required -------
	------------------------
	use({ "lewis6991/impatient.nvim", config = get_config("impatient") })
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })

	------------------------
	-------- Colour --------
	------------------------

	use({
		"folke/tokyonight.nvim",
		after = "packer.nvim",
		config = get_config("tokyonight"),
	})

	------------------------
	--------- LSP ----------
	------------------------
	use({
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		requires = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
		config = get_config("lsp-installer"),
	})

	------------------------
	----- Completion -------
	------------------------
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = get_config("cmp"),
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			{ "windwp/nvim-autopairs", config = get_config("autopairs") },
		},
	})

	use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

	------------------------
	------ Treesitter ------
	------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = get_config("treesitter"),
		after = "packer.nvim",
	})

	use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	------------------------
	--------- FZF ----------
	------------------------
	use({
		"nvim-telescope/telescope.nvim",
		config = get_config("telescope"),
		cmd = "Telescope",
	})

	------------------------
	------- Editing --------
	------------------------
	use({
		"booperlv/nvim-gomove",
		config = get_config("gomove"),
		event = "BufRead",
	})
	use({
		"kevinhwang91/nvim-hlslens",
		config = get_config("hlslens"),
		event = "BufRead",
	})
	use({
		"ggandor/lightspeed.nvim",
		event = "BufRead",
		requires = "tpope/vim-repeat",
	})
	use({
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = get_config("zen"),
	})
	use({ "ray-x/lsp_signature.nvim", after = "nvim-lspconfig" })
	use({ "kylechui/nvim-surround", config = get_config("surround"), event = "BufRead" })
	use({
		"ThePrimeagen/harpoon",
		after = "plenary.nvim",
		config = get_config("harpoon"),
	})
	use({
		"numToStr/Comment.nvim",
		config = get_config("comment"),
		after = "nvim-treesitter",
	})
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use({
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = get_config("escape"),
	})

	------------------------
	--------- UI -----------
	------------------------
	use({ "RRethy/vim-illuminate", after = "nvim-lspconfig" })
	use({ "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = get_config("indent-blankline") })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		after = "tokyonight.nvim",
		config = get_config("lualine"),
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = get_config("trouble"),
		cmd = "Trouble",
	})
	use({
		"glepnir/dashboard-nvim",
		after = "packer.nvim",
		config = get_config("dashboard"),
	})
	use({
		"kyazdani42/nvim-tree.lua",
		config = get_config("tree"),
		cmd = "NvimTreeFocus",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = get_config("treesitter-context"),
	})

	------------------------
	--------- GIT ----------
	------------------------
	use({ "lewis6991/gitsigns.nvim", tag = "release", event = "BufRead", config = get_config("git") })
	use({
		"pwntester/octo.nvim",
		cmd = "Octo",
		config = get_config("octo"),
	})

	------------------------
	------- FORMAT  --------
	------------------------
	use({
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = get_config("nullls"),
	})

	------------------------
	------- TERMINAL -------
	------------------------
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = get_config("toggleterm"),
		after = "packer.nvim",
	})
end)
