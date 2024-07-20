return {
	"Mofiqul/dracula.nvim",
	config = function()
		require("dracula").setup({
			transparent_bg = true,
			show_end_of_buffer = true,
			italic_comment = true,
			colors = {},
			overrides = {},
		})
		vim.cmd.colorscheme("dracula")
	end,
}
