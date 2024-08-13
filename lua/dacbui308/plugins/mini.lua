return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.comment").setup({

			options = {
				custom_commentstring = nil,
				ignore_blank_line = false,
				start_of_line = false,
				pad_comment_parts = true,
			},
			mappings = {
				comment_line = "<leader>cl",
				comment_visual = "<leader>cb",
				textobject = "<leader>cl",
			},
			hooks = {
				pre = function() end,
				post = function() end,
			},
		})
		require("mini.indentscope").setup()
		require("mini.starter").setup()
		require("mini.statusline").setup()
		require("mini.icons").setup()
		require("mini.icons").mock_nvim_web_devicons()
		require("mini.bufremove").setup()
		require("mini.notify").setup({
			window = {
				-- Floating window config
				config = {},

				-- Maximum window width as share (between 0 and 1) of available columns
				max_width_share = 0.2,

				-- Value of 'winblend' option
				winblend = 5,
			},
		})
	end,
}
