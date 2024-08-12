vim.keymap.set("n", "<leader>qfl", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd(action)
end, { desc = "Open quickfix list" })

vim.keymap.set("n", "<C-j>", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cnext" or "wincmd j"
	vim.cmd(action)
end, { desc = "Next item in the quickfix list" })

vim.keymap.set("n", "<C-k>", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cprev" or "wincmd k"
	vim.cmd(action)
end, { desc = "Previous item in the quickfix list" })

vim.keymap.set("n", "<leader>att", function()
	local win = vim.api.nvim_get_current_win()
	local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local action = qf_winid > 0 and "lclose" or "lopen"
	vim.cmd(action)
end)

vim.keymap.set("n", "<C-h>", function()
	local win = vim.api.nvim_get_current_win()
	local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local action = qf_winid > 0 and "lprev" or "wincmd h"
	vim.cmd(action)
end, { desc = "Previous item in the loclist" })

vim.keymap.set("n", "<C-l>", function()
	local win = vim.api.nvim_get_current_win()
	local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local action = qf_winid > 0 and "lnext" or "wincmd l"
	vim.cmd(action)
end, { desc = "next item in the loclist" })
