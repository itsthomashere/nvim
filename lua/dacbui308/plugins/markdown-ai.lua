return {
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		ft = "markdown",
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown", "vimwiki" },
			})
			vim.treesitter.language.register("markdown", "vimwiki")
		end,
	},

	-- {
	-- 	"nomnivore/ollama.nvim",
	-- 	config = function()
	-- 		require("ollama").setup({})
	-- 	end,
	-- },
}
