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
	{
		-- "eldritch-theme/eldritch.nvim",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	require("eldritch").setup({
		-- 		transparent = false,
		-- 	})
		-- 	Transparent("eldritch")
		-- end,
	},
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({})
	-- 		Transparent("rose-pine-moon")
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
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({})
	-- 		Transparent("gruvbox")
	-- 	end,
	-- },
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup()
			Transparent("nightfox")
		end,
	},
}
