return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"html",
				"css",
				"rust",
				"dockerfile",
				"typescript",
				"markdown",
			},
			incremental_selection = {
				enable = true,
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
		require("treesitter-context").setup({
			max_lines = 2,
			separator = nil,
		})
	end,
}
