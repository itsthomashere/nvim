return {
	"saghen/blink.cmp",
	event = { "InsertEnter" },
	version = "v0.*",
	opts = {
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
	},
	config = function()
		require("dacbui308.custom.blink")
	end,
}
