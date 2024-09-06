return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	priority = 1000,
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			styles = {
	-- 				italic = false,
	-- 				transparency = false,
	-- 			},
	-- 			highlight_groups = {
	-- 				StatusLine = { fg = "iris", bg = "iris", blend = 10 },
	-- 				StatusLineNC = { fg = "subtle", bg = "surface" },
	-- 				TelescopeBorder = { fg = "overlay", bg = "overlay" },
	-- 				TelescopeNormal = { fg = "subtle", bg = "overlay" },
	-- 				TelescopeSelection = { fg = "text", bg = "highlight_med" },
	-- 				TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
	-- 				TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
	--
	-- 				TelescopeTitle = { fg = "base", bg = "love" },
	-- 				TelescopePromptTitle = { fg = "base", bg = "pine" },
	-- 				TelescopePreviewTitle = { fg = "base", bg = "iris" },
	--
	-- 				TelescopePromptNormal = { fg = "text", bg = "surface" },
	-- 				TelescopePromptBorder = { fg = "surface", bg = "surface" },
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
	-- 			styles = {
	-- 				functions = { italic = true },
	-- 				variables = { italic = true },
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
	-- 		vim.cmd.colorscheme("kanagawa-dragon")
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup()
			vim.cmd.colorscheme("carbonfox")
		end,
	},
}
