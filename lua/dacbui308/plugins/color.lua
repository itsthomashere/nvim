return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				bold = true,
				italic = true,
				transparency = false,
			},
		})
		Transarent("rose-pine-main")
	end,
}
