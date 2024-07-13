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
			modules = {},
			ignore_install = {},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		require("treesitter-context").setup()
	end,
}
