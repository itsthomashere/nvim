return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup()
			vim.cmd.colorscheme("rose-pine-main")
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				terminalColors = true,
				dimInactive = true,
			})
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
