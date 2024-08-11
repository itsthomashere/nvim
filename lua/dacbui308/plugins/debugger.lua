return {
	"rcarriga/nvim-dap-ui",
	ft = "rust",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("nvim-dap-virtual-text").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<leader>dui", function()
			dapui.toggle()
		end)
		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
		vim.keymap.set("n", "<leader>dbc", dap.continue)
		vim.keymap.set("n", "<leader>dbr", dap.restart)
		vim.keymap.set("n", "<leader>dbi", dap.step_into)
		vim.keymap.set("n", "<leader>dbo", dap.step_over)
		vim.keymap.set("n", "<leader>dbb", dap.step_back)
		vim.keymap.set("n", "<leader>dbx", dap.step_out)
		vim.keymap.set("n", "<space>?", function()
			dapui.eval(nil, { enter = true })
		end)

		dap.adapters.lldb = {
			type = "executable",
			command = "/bin/lldb-dap",
			name = "lldb",
		}
		dap.configurations.rust = {
			{
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
	end,
}
