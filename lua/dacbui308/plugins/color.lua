return {
	"Mofiqul/vscode.nvim",
	config = function()
		vim.cmd.colorscheme("vscode")
		function Transparent(color)
			color = color or "vscode"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })

			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none", ctermfg = "none" })
		end
		Transparent()
	end,
}
