return {
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("dacbui308.custom.rust")
		end,
	},
	{
		dir = "/home/dacbui308/.config/nvim/lua/dacbui308/personal/",
		ft = { "rust" },
		config = function()
			require("dacbui308.personal.rust").setup({})
		end,
	},
}
