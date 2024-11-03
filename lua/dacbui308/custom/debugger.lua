local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({})
dapui.setup()

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

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

vim.keymap.set("n", "<leader>dt", dapui.toggle)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>B", dap.set_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>db", dap.step_back)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>dO", dap.step_out)
vim.keymap.set("n", "<leader>dI", dap.run_to_cursor)

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-dap",
	name = "lldb",
}

dap.adapters.delve = function(callback, config)
	if config.mode == "remote" and config.request == "attach" then
		callback({
			type = "server",
			host = config.host or "127.0.0.1",
			port = config.port or "38697",
		})
	else
		callback({
			type = "server",
			port = "${port}",
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
				detached = vim.fn.has("win32") == 0,
			},
		})
	end
end

dap.configurations.cpp = {
	{
		type = "lldb",
		name = "Attach to PID",
		request = "attach",
		pid = require("dap.utils").pick_process,
	},
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = function()
			return coroutine.create(function(coro)
				local opts = {}
				pickers
					.new(opts, {
						prompt_title = "Path to executable",
						finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
						sorter = conf.generic_sorter(opts),
						attach_mappings = function(buffer_number)
							actions.select_default:replace(function()
								actions.close(buffer_number)
								coroutine.resume(coro, action_state.get_selected_entry()[1])
							end)
							return true
						end,
					})
					:find()
			end)
		end,
	},
}
dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		cwd = "${workspaceFolder}",
		program = function()
			return coroutine.create(function(coro)
				local opts = {}
				pickers
					.new(opts, {
						prompt_title = "Path to executable",
						finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
						sorter = conf.generic_sorter(opts),
						attach_mappings = function(buffer_number)
							actions.select_default:replace(function()
								actions.close(buffer_number)
								coroutine.resume(coro, action_state.get_selected_entry()[1])
							end)
							return true
						end,
					})
					:find()
			end)
		end,
		initCommands = function()
			-- Find out where to look for the pretty printer Python module
			local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))

			local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
			local commands_file = rustc_sysroot .. "/lib/rustlib/etc/lldb_commands"

			local commands = {}
			local file = io.open(commands_file, "r")
			if file then
				for line in file:lines() do
					table.insert(commands, line)
				end
				file:close()
			end
			table.insert(commands, 1, script_import)

			return commands
		end,
	},

	{
		type = "lldb",
		name = "Attach to PID",
		request = "attach",
		pid = require("dap.utils").pick_process,
	},
}

dap.configurations.go = {
	{
		type = "delve",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},

	{
		type = "delve",
		name = "Debug package",
		request = "launch",
		program = "${fileDirname}",
	},

	{
		type = "delve",
		name = "Debug test", -- configuration for debugging test files
		request = "launch",
		mode = "test",
		program = "${file}",
	},
	-- works with go.mod packages and sub packages
	{
		type = "delve",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
	{
		type = "delve",
		name = "Attach to PID",
		request = "attach",
		mode = "local",
		processId = require("dap.utils").pick_process,
	},
}
