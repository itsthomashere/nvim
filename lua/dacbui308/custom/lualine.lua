require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { { "mode", icons_enabled = true, icon = "" } },
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "diagnostics", "diff", "branch" },
	},
	inactive_sections = {},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
