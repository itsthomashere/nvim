return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	build = ":TSUpdate",
	config = function()
		require("dacbui308.custom.treesitter")
	end,
}
