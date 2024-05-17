return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight")
		function Transparent(color)
			color = color or "tokyonight"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })

			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
		end
		Transparent()
	end,
}
