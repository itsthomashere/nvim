return { -- Autocompletion
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}
		cmp.setup({
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
					selection_order = "near_cursor",
					follow_cursor = true,
				},
			},
			formatting = {
				view = {
					name = "custom",
					selection_order = "top_down",
				},
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s ", kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
					if vim_item.abbr ~= nil then
						if vim.fn.strlen(vim_item.abbr) > 25 then
							vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0, 23) .. "...")
						else
							vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0))
						end
					end
					if vim_item.menu ~= nil then
						if vim.fn.strlen(vim_item.menu) > 25 then
							vim_item.menu = (vim.fn.strcharpart(vim_item.menu, 0, 23) .. "...")
						else
							vim_item.menu = (vim.fn.strcharpart(vim_item.menu, 0))
						end
					end

					return vim_item
				end,
				fields = { "kind", "abbr", "menu" },
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
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
				{ name = "path", priority = 250 },
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
