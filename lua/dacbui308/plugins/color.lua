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
	-- 		Transparent("rose-pine")
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
	-- 		vim.cmd.colorscheme("tokyonight")
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
	-- 			italics = true,
	-- 			guicursor = false,
	-- 		})
	-- 		vim.cmd.colorscheme("bluloco-dark")
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
	-- 		vim.cmd.colorscheme("carbonfox")
	-- 	end,
	-- },
	--
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dracula").setup()
			Transparent("dracula")
		end,
	},
}
