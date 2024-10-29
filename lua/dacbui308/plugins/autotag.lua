return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "htmldjango" },
	config = function()
		require("dacbui308.custom.autotag")
	end,
}
