return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		require("kanagawa").load("dragon")
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
