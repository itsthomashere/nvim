return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		vim.cmd.colorscheme("rose-pine-moon")
		function Transparent(color)
			color = color or "rose-pine-moon"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })

			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
		end
		Transparent()
	end,
}
