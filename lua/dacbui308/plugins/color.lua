return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup()
		function Transparent(color)
			if color == nil then
				return
			end
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
		end
		Transparent("catppuccin-mocha")
	end,
}
