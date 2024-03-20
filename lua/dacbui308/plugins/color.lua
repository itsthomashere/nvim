return {
	"rebelot/kanagawa.nvim",
	name = "kanagawa",
	config = function()
		require("kanagawa").setup({})
		vim.cmd("colorscheme kanagawa")
	end,
}
