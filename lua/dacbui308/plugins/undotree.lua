return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>tn", vim.cmd.UndotreeToggle, {})
	end,
}
