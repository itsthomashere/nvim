return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
	},
	config = function()
		require("dacbui308.custom.lspconfig")
	end,
}
