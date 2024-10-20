return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		local thomas = vim.api.nvim_create_augroup("thomas_fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = thomas,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end
			end,
		})

		vim.keymap.set("n", "<leader>gvd", "<C-w>o<cmd>Gvdiffsplit!<CR>")
		vim.keymap.set({ "n", "v" }, "ge", "<cmd>diffget //2<CR>")
		vim.keymap.set({ "n", "v" }, "gi", "<cmd>diffget //3<cr>")
	end,
}
