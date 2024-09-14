return {
	"Saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	opts = {
		completion = {
			cmp = { enabled = true },
		},
		lsp = {
			enabled = true,
			actions = true,
			hover = true,
			completion = true,
		},
	},
}
