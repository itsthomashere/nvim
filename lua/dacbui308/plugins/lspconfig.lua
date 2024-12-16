return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "folke/neoconf.nvim", ft = { "rust" } },
	},
	config = function()
		require("neoconf").setup()
		require("dacbui308.custom.lspconfig")
	end,
}
