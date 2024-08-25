return {
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup()
	-- 		Transparent("cyberdream")
	-- 	end,
	-- },
	-- {
	-- 	"eldritch-theme/eldritch.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("eldritch").setup({
	-- 			transparent = false,
	-- 		})
	-- 		Transparent("eldritch")
	-- 	end,
	-- },
	{
		"rose-pine/neovim",
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
					transparency = false,
				},
				highlight_groups = {
					StatusLine = { fg = "iris", bg = "iris", blend = 10 },
					StatusLineNC = { fg = "subtle", bg = "surface" },
					TelescopeBorder = { fg = "overlay", bg = "overlay" },
					TelescopeNormal = { fg = "subtle", bg = "overlay" },
					TelescopeSelection = { fg = "text", bg = "highlight_med" },
					TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
					TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

					TelescopeTitle = { fg = "base", bg = "love" },
					TelescopePromptTitle = { fg = "base", bg = "pine" },
					TelescopePreviewTitle = { fg = "base", bg = "iris" },

					TelescopePromptNormal = { fg = "text", bg = "surface" },
					TelescopePromptBorder = { fg = "surface", bg = "surface" },
				},
			})
			Transparent("rose-pine")
		end,
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		require("kanagawa").setup({
	-- 			transparent = false,
	-- 			compile = true,
	-- 			terminalColors = true,
	-- 		})
	-- 		vim.cmd.colorscheme("kanagawa-dragon")
	-- 		vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "none" })
	-- 		vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "none" })
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup()
	-- 		Transparent("catppuccin")
	-- 	end,
	-- },
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("gruvbox").setup({
	-- 			contrast = "soft",
	-- 			transparent_mode = false,
	-- 			italic = {
	-- 				strings = true,
	-- 				emphasis = true,
	-- 				comments = true,
	-- 				operators = true,
	-- 				folds = true,
	-- 			},
	-- 			overrides = {
	-- 				Keyword = { italic = true, fg = "#fb4934" },
	-- 				Function = { bold = true, fg = "#b8bb26", italic = true },
	-- 				Conditional = { italic = true, fg = "#fb4934" },
	-- 				["@variable"] = { fg = "#ebdbb2", italic = true },
	-- 				["@variable.parameter"] = { fg = "#83a598", italic = true },
	-- 				["@property"] = { fg = "#83a598", italic = true },
	-- 			},
	-- 		})
	-- 		vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "none" })
	-- 		vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "none" })
	-- 		Transparent("gruvbox")
	-- 	end,
	-- },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			transparent = true,
	-- 		})
	-- 		Transparent("nightfox")
	-- 	end,
	-- },
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("dracula").setup({
	-- 			overrides = {
	-- 				Keyword = { italic = true },
	-- 				Function = { bold = true, italic = true },
	-- 				Conditional = { italic = true },
	-- 				["@variable"] = { italic = true },
	-- 				["@variable.parameter"] = { italic = true },
	-- 				["@property"] = { italic = true },
	-- 			},
	-- 		})
	-- 		Transparent("dracula")
	-- 	end,
	-- },
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	config = function()
	-- 		require("vscode").setup({})
	-- 		vim.cmd.colorscheme("vscode")
	-- 	end,
	-- },
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- 	config = function()
	-- 		require("onedarkpro").setup({})
	-- 		Transparent("onedark")
	-- 	end,
	-- },
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			plugins = {
	-- 				markdown = true,
	-- 			},
	-- 			styles = {
	-- 				functions = { italic = true },
	-- 				variables = { italic = true },
	-- 			},
	-- 		})
	-- 		Transparent("tokyonight")
	-- 	end,
	-- },
	-- {
	-- 	"RRethy/base16-nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("base16-equilibrium-dark")
	-- 	end,
	-- },
}
