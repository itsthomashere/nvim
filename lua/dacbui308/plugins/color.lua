return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			styles = {
	-- 				italic = true,
	-- 				transparency = false,
	-- 			},
	-- 		})
	-- 		Transparent("rose-pine-moon")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			plugins = {
	-- 				markdown = true,
	-- 			},
	-- 		})
	-- 		Transparent("tokyonight")
	-- 	end,
	-- },
	-- {
	-- 	"metalelf0/jellybeans-nvim",
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("jellybeans-nvim")
	-- 	end,
	-- },
	-- {
	-- 	"uloco/bluloco.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	dependencies = { "rktjmp/lush.nvim" },
	-- 	config = function()
	-- 		require("bluloco").setup({
	-- 			guicursor = false,
	-- 			italics = true,
	-- 		})
	-- 		Transparent("bluloco-dark")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("kanagawa").setup()
	-- 		vim.cmd.colorscheme("kanagawa-wave")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nightfox").setup()
	-- 		vim.cmd.colorscheme("nightfox")
	-- 	end,
	-- },
	--
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("dracula").setup()
	-- 		Transparent("dracula")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			transparent_background = false,
	-- 		})
	-- 		Transparent("catppuccin-mocha")
	-- 	end,
	-- },
	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("eldritch").setup({})
	-- 		Transparent("eldritch")
	-- 	end,
	-- },
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("ayu").setup({
	-- 			overrides = {
	-- 				NonText = { fg = "#575e71" },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("ayu")
	-- 	end,
	-- },
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "deep",
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "hard",
	-- 		})
	--
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },
	-- {
	-- 	dir = "/home/dacbui308/.config/nvim/grace",
	-- 	dependencies = "rktjmp/lush.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("grace")
	-- 	end,
	-- },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_diagnostic_line_highlight = 1
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_diagnostic_text_highlight = 0
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_float_style = "dim"
			vim.cmd.colorscheme("gruvbox-material")
			vim.opt.statusline = "  %f %m %= %l:%c Chan "
		end,
	},
}
