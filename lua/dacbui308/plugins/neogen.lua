return {
	"danymat/neogen",
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
		})
		vim.keymap.set("n", "<leader>tf", function()
			require("neogen").generate({ type = "func" })
		end)
		vim.keymap.set("n", "<leader>tc", function()
			require("neogen").generate({ type = "class" })
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("neogen").generate({ type = "type" })
		end)
	end,
}
