return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
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
			highlight = { enable = false },
			indent = { enable = false },
			additional_vim_regex_highlighting = false,
		})
	end,
}
