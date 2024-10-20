return {
	{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	{
		"norcalli/nvim-colorizer.lua",
		ft = "lua",
		config = function()
			require("colorizer").setup()
		end,
	},
}
