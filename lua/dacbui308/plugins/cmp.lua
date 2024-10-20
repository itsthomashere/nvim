return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.event:on("complete_done", vim.snippet.stop)
		cmp.setup({
			-- performance = {
			-- 	max_view_entries = 15,
			-- },
			matching = {
				disallow_fuzzy_matching = false,
				disallow_symbol_nonprefix_matching = true,
				disallow_prefix_unmatching = false,
				disallow_partial_fuzzy_matching = false,
				disallow_fullfuzzy_matching = true,
				disallow_partial_matching = false,
			},
			view = {
				entries = {
					name = "custom",
					selection_order = "top_down",
					follow_cursor = true,
				},
				docs = {
					auto_open = true,
				},
			},
			formatting = {
				view = {
					name = "custom",
					selection_order = "top_down",
				},
				format = function(entry, vim_item)
					local stuff = ({
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						path = "[DIR]",
					})[entry.source.name]
					vim_item.kind = string.format("%s %s", stuff, vim_item.kind) -- This concatenates the icons with the name of the item kind

					if vim_item.abbr ~= nil then
						if vim.fn.strlen(vim_item.abbr) > 35 then
							vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0, 30) .. "...")
						else
							vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0))
						end
					end
					if vim_item.menu ~= nil then
						if vim.fn.strlen(vim_item.menu) > 25 then
							vim_item.menu = (vim.fn.strcharpart(vim_item.menu, 0, 20) .. "...")
						else
							vim_item.menu = (vim.fn.strcharpart(vim_item.menu, 0))
						end
					end
					return vim_item
				end,
				fields = { "abbr", "menu", "kind" },
				expandable_indicator = false,
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
				["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				["<C-Space>"] = cmp.mapping(function()
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				end, { "i", "s" }),

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
				{ name = "path", priority = 250 },
				{ name = "crates" },
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
			},
		})
	end,
}
