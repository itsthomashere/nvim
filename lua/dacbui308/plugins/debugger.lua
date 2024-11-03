return {
	"mfussenegger/nvim-dap",
	ft = { "go", "c", "cpp", "rust" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},

	config = function()
		require("dacbui308.custom.debugger")
	end,
}
