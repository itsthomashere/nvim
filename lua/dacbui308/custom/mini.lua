-- require("mini.ai").setup({})
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
-- require("mini.indentscope").setup()
require("mini.starter").setup({
	header = "  Thomas  \n      ",
	items = {},
	query_updates = {},
})
require("mini.bufremove").setup()
require("mini.icons").mock_nvim_web_devicons()
