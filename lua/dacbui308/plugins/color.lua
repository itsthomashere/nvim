return {
	"navarasu/onedark.nvim",
	config = function()
		-- Lua
		require("onedark").setup({
			-- Main options --
			style = "deep",
			transparent = false,
			term_colors = true,
			ending_tildes = false,
			cmp_itemkind_reverse = false,
			code_style = {
				comments = "italic",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none",
			},

			-- Lualine options --
			lualine = {
				transparent = false, -- lualine center bar transparency
			},

			-- Custom Highlights --
			colors = {}, -- Override default colors
			highlights = {},

			-- Plugins Config --
			diagnostics = {
				darker = true, -- darker colors for diagnostic
				undercurl = true, -- use undercurl instead of underline for diagnostics
				background = true, -- use background color for virtual text
			},
		})
		vim.cmd.colorscheme("onedark")
	end,
}
