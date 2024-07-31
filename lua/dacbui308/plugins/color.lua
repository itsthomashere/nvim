return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			disable_background = true,
		})
		-- vim.cmd.colorscheme("rose-pine-moon")
		Transparent("rose-pine-moon")
	end,
}
