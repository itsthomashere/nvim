return {
	"Saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	config = function()
		require("dacbui308.custom.rust")
	end,
}
