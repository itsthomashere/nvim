return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "htmldjango", "gotmpl", "tmpl", "template" },
	config = function()
		require("dacbui308.custom.autotag")
	end,
}
