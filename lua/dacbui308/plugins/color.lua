return {
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup()
	-- 		Transparent("cyberdream")
	-- 	end,
	-- },
	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("eldritch").setup({
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd.colorscheme("eldritch")
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = true,
					transparency = false,
				},
				highlight_groups = {
					Keyword = { italic = true },
					Function = { italic = true },
					-- Conditional = { italic = true },
					StatusLine = { fg = "iris", bg = "iris", blend = 10 },
					StatusLineNC = { fg = "subtle", bg = "surface" },
				},
			})
			vim.opt.laststatus = 2 -- Or 3 for global statusline
			vim.opt.statusline = " %f %m %= %l:%c ♥ "
			Transparent("rose-pine")
		end,
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			transparent = false,
	-- 			compile = true,
	-- 			terminalColors = true,
	-- 			background = "",
	-- 			theme = "dragon",
	-- 		})
	-- 		vim.cmd.colorscheme("kanagawa")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup()
	-- 		Transparent("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"morhetz/gruvbox",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		Transparent("gruvbox")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			transparent = true,
	-- 		})
	-- 		Transparent("nightfox")
	-- 	end,
	-- },
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("dracula").setup()
	-- 		Transparent("dracula")
	-- 	end,
	-- },
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- 	config = function()
	-- 		require("onedarkpro").setup({})
	-- 		Transparent("onedark")
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
	-- 			styles = {
	-- 				functions = { italic = true },
	-- 				variables = { italic = true },
	-- 			},
	-- 		})
	-- 		Transparent("tokyonight")
	-- 	end,
	-- },
}
