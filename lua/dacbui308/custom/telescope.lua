require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
		fzf = {
			fuzzy = true,
		},
	},
})
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
vim.keymap.set("n", "<leader>fw", function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end, {})
vim.keymap.set("n", "<leader>fW", function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end, {})
vim.keymap.set("n", "<leader>fp", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
