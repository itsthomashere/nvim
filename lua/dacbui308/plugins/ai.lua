return {
	{
		-- "Exafunction/codeium.vim",
		-- config = function()
		-- 	vim.g.codeium_disable_bindings = 1
		-- 	vim.g.codeium_enabled = false
		-- 	vim.keymap.set("i", "<Tab>", function()
		-- 		return vim.fn["codeium#Accept"]()
		-- 	end, { expr = true, silent = true })
		-- end,
	},

	{
		"MeanderingProgrammer/markdown.nvim",
		dependencies = { "echasnovski/mini.nvim" }, -- if you prefer nvim-web-devicons
		config = function()
			require("dacbui308.custom.ai")
		end,
	},
}
