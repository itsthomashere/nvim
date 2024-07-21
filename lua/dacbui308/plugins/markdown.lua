return {
	"MeanderingProgrammer/markdown.nvim",
	lazy = true,
	ft = "markdown",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	opts = { file_types = { "markdown", "vimwiki" } },
}
