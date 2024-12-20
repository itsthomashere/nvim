local cmp = require("cmp")
cmp.event:on("complete_done", vim.snippet.stop)
cmp.setup({
	-- performance = {
	-- 	max_view_entries = 10,
	-- },
	matching = {
		disallow_fuzzy_matching = true,
		disallow_symbol_nonprefix_matching = true,
		disallow_prefix_unmatching = false,
		disallow_partial_fuzzy_matching = true,
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
		format = function(_, vim_item)
			vim_item.menu = nil

			if vim_item.abbr ~= nil then
				if vim.fn.strlen(vim_item.abbr) > 35 then
					vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0, 30) .. "...")
				else
					vim_item.abbr = (vim.fn.strcharpart(vim_item.abbr, 0))
				end
			end
			return vim_item
		end,
		fields = { "abbr", "kind" },
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
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-y>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				local entry = cmp.get_selected_entry()
				if not entry then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
				end
				cmp.confirm()
			else
				fallback()
			end
		end, { "i", "s", "c" }),
		["<C-Space>"] = cmp.mapping(function()
			if cmp.visible_docs() then
				cmp.close_docs()
			else
				cmp.open_docs()
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
