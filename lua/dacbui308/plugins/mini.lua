return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("mini.ai").setup()
		require("mini.indentscope").setup()
		require("mini.comment").setup()
		require("mini.surround").setup()
		require("mini.cursorword").setup()
		require("mini.tabline").setup()
		require("mini.bufremove").setup()
		require("mini.statusline").setup()
	end,
}
