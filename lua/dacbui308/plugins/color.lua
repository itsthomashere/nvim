return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				terminalColors = true,
				dimInactive = true,
			})
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	config = function()
		function Transparent(color)
			if color == nil then
				return
			end
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })
		end
	end,
}
