return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup()
			function Transparent(color)
				if color == nil then
					return
				end
				vim.cmd.colorscheme(color)
				vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermfg = "none" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermfg = "none" })
			end
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
}
