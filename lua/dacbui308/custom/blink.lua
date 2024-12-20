require("blink.cmp").setup({
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path" },
		providers = {
			buffer = {
				enabled = false,
			},
		},
		cmdline = {},
	},
	completion = {
		menu = {
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
				components = {
					label = {
						width = { fill = true, max = 60 },
						text = function(ctx)
							return ctx.label
						end,
						highlight = function(ctx)
							local highlights = {
								{
									0,
									#ctx.label,
									group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
								},
							}
							for _, idx in ipairs(ctx.label_matched_indices) do
								table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
							end

							return highlights
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
