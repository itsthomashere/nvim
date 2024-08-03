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
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup()
			Transparent("gruvbox")
		end,
	},
}
