return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		-- url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	build = ":TSUpdate",
	config = function()
		require("dacbui308.custom.treesitter")
	end,
}
