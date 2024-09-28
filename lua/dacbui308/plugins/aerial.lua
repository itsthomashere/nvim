return {
	"stevearc/aerial.nvim",
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},

	config = function()
		require("aerial").setup()
		vim.keymap.set("n", "<leader>fn", "<cmd>AerialToggle!<CR>")
	end,
}
