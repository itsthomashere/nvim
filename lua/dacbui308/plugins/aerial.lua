return {
	"stevearc/aerial.nvim",
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("aerial").setup()
		vim.keymap.set("n", "<leader>fn", "<cmd>AerialToggle!<CR>")
	end,
}
