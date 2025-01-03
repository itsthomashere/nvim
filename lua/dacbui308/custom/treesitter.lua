local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = {
		"lua",
		"javascript",
		"rust",
		"dockerfile",
		"typescript",
		"go",
		"markdown",
		"markdown_inline",
		"html",
		"gotmpl",
	},
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	modules = {},
	ignore_install = {},
	sync_install = true,
	auto_install = false,
	highlight = { enable = true },
	indent = { enable = true },
	additional_vim_regex_highlighting = false,
})

-- require("treesitter-context").setup({
-- 	max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
-- })
