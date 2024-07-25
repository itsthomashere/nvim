return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			formatting = {
				view = {
					name = "custom",
					selection_order = "near_cursor",
				},
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 40,
					ellipsis_char = "...",
					menu = {},
				}),
				fields = { "kind", "abbr" },
				expandable_indicator = true,
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert, select" },
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-l>"] = cmp.mapping(function()
					if vim.snippet.active({ direction = 1 }) then
						vim.snippet.jump(1)
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if vim.snippet.active({ direction = -1 }) then
						vim.snippet.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp", priority = 1000 },
				{ name = "buffer", priority = 750 },
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
