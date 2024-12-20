require("blink.cmp").setup({
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path" },
		providers = {
			buffer = {
				enabled = false,
			},
			snippets = {
				enabled = false,
			},
		},
		cmdline = {},
	},
	completion = {
		accept = {
			auto_brackets = {
				enabled = false,
			},
		},
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
				components = {
					label = {
						text = function(ctx)
							return ctx.label
						end,
					},
					source_name = {},
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
			treesitter_highlighting = true,
		},
	},
	fuzzy = {
		use_typo_resistance = false,
	},
})
