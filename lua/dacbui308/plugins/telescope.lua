return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fww", builtin.grep_string, {})
		vim.keymap.set("n", "<leader>fwg", builtin.live_grep, {})
	end,
}
