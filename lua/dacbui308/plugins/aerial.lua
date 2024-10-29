return {
	"stevearc/aerial.nvim",
	config = function()
		require("aerial").setup({
			backends = { "lsp" },
			layout = {
				max_width = "0.25",
			},
		})
		vim.keymap.set("n", "<leader>fn", require("aerial").toggle)
	end,
}
