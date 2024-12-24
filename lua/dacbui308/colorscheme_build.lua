local lushwright = require("shipwright.transform.lush")
local colorscheme = require("grace.lua.lush_theme.grace")
print(colorscheme)
run(
	colorscheme,
	lushwright.to_lua,
	{ overwrite, "/home/dacbui308/.config/nvim/lua/dacbui308/color.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
