return {
	"stevearc/aerial.nvim",
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("aerial").setup()
	end,
}
