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
	-- 			transparent = false,
	-- 		})
	-- 		Transparent("eldritch")
	-- 	end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	-- 		Transparent("rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			transparent = true,
	-- 			compile = true,
	-- 			terminalColors = true,
	-- 			background = "",
	-- 			theme = "wave",
	-- 		})
	-- 		Transparent("kanagawa-wave")
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
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup()
			Transparent("tokyonight")
		end,
	},
}
