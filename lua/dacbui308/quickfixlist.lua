vim.keymap.set("n", "<leader>qfl", function()
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action = qf_winid > 0 and "cclose" or "copen"
	vim.cmd(action)
end, { desc = "Open quickfix list" })

vim.keymap.set("n", "<leader>att", function()
	local win = vim.api.nvim_get_current_win()
	local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local action = qf_winid > 0 and "lclose" or "lopen"
	vim.cmd(action)
end)

vim.keymap.set("n", "<A-j>", function()
	local win = vim.api.nvim_get_current_win()
	local loclist_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action
	if qf_winid > 0 and loclist_winid == 0 then
		action = "cnext"
	elseif loclist_winid > 0 and qf_winid == 0 then
		action = "lnext"
	else
		action = "move .+1<CR>=="
	end
	vim.cmd(action)
end)

vim.keymap.set("n", "<A-k>", function()
	local win = vim.api.nvim_get_current_win()
	local loclist_winid = vim.fn.getloclist(win, { winid = 0 }).winid
	local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
	local action
	if qf_winid > 0 and loclist_winid == 0 then
		action = "cprev"
	elseif loclist_winid > 0 and qf_winid == 0 then
		action = "lprev"
	else
		action = "move .-2<CR>=="
	end
	vim.cmd(action)
end)

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
