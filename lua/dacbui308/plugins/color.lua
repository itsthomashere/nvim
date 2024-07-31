return {
	"navarasu/onedark.nvim",
	name = "onedark",
	config = function()
		require("onedark").setup({
			style = "deep",
			transparent = true,
		})
		-- vim.cmd.colorscheme("rose-pine-moon")
		Transparent("onedark")
	end,
}
