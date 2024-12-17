require("blink.cmp").setup({
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "normal",
	},
	sources = {
		default = { "lsp", "path" },
		providers = {
			buffer = {},
		},
	},
	completion = {
		menu = {
			draw = {
				columns = { { "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
})
