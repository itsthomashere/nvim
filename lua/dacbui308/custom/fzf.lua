local fzf = require("fzf-lua")
fzf.register_ui_select()
fzf.setup({
	{ "borderless", "telescope" },
	git_icons = false,
	winopts = {
		preview = {
			default = "builtin",
			layout = "horizontal",
			horizontal = "right:45%",
		},
	},
})

vim.keymap.set("n", "<leader>ff", fzf.files, {})
vim.keymap.set("n", "<leader>fg", fzf.git_files, {})
vim.keymap.set("n", "<leader><leader>", fzf.buffers, {})
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, {})
vim.keymap.set("n", "<leader>fW", fzf.grep_cWORD, {})
vim.keymap.set("n", "<leader>fp", fzf.live_grep, {})
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_workspace)
