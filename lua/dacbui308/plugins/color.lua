return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "main",
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("rose-pine")
	-- 	end,
	-- },
	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	name = "onedark",
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "deep", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	-- 			transparent = true, -- Show/hide background
	-- 			term_colors = true, -- Change terminal color as per the selected theme style
	-- 			ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	-- 			cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
	--
	-- 			lualine = {
	-- 				transparent = true, -- lualine center bar transparency
	-- 			},
	-- 			diagnostics = {
	-- 				darker = true, -- darker colors for diagnostic
	-- 				undercurl = true, -- use undercurl instead of underline for diagnostics
	-- 				background = false, -- use background color for virtual text
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "storm",
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			compile = true,
	-- 			terminalColors = true,
	-- 			theme = "dragon",
	-- 			background = {
	-- 				dark = "dragon",
	-- 				light = "lotus",
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("kanagawa")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("carbonfox")
	-- 	end,
	-- },
	-- {
	-- 	"marko-cerovac/material.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("material-darker")
	-- 	end,
	-- },
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup()
			vim.cmd.colorscheme("vscode")
		end,
	},
}
