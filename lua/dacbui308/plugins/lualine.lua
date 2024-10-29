return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "arkav/lualine-lsp-progress" },
	config = function()
		require("dacbui308.custom.lualine")
	end,
}
