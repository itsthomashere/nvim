require("crates").setup({
	completion = {
		-- cmp = { enabled = true },
	},
	lsp = {
		enabled = true,
		actions = true,
		hover = true,
		completion = true,
	},
})
