---@module "dacbui308.personal.rust"

local rust = {}

---@class dacbui308.personal.rust.command_tbl
---@field handler fun(args: string[], opts: vim.api.keyset.user_command?)
---@field complete? fun(subcmd_arg_lead: string): string[]
---@field bang? boolean

---@type dacbui308.personal.rust.command_tbl[]
local rust_lsp_cmd = {
	---@type dacbui308.personal.rust.command_tbl
	expandMacro = {
		handler = function(_)
			require("dacbui308.personal.rust_analyzer.expand_macro_recursive"):expand_macro()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	syntaxTree = {
		handler = function(_)
			require("dacbui308.personal.rust_analyzer.view_syntax_tree"):syntax_tree()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	rebuildMacro = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.rebuild_proc_macro"):rebuild_proc_macro()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	crateGraph = {
		handler = function(args, opts) end,
	},
	---@type dacbui308.personal.rust.command_tbl
	reloadWorkspace = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.reload_workspace"):reload_workspace()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	flyCheck = {
		handler = function(args, _)
			local cmd = args[1] or "run"
			require("dacbui308.personal.rust_analyzer.fly_check"):fly_check(cmd)
		end,
		complete = function(subcmd_arg_lead)
			return vim.tbl_filter(function(arg)
				return arg:find(subcmd_arg_lead) ~= nil
			end, { "run", "clear", "cancel" })
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	viewHIR = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.view_hir"):view_hir()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	viewMIR = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.view_mir"):view_mir()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	viewFileText = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.view_file_text"):view_text_file()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	viewItemTree = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.view_item_tree"):view_item_tree()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	relatedTests = {
		handler = function(args, opts) end,
	},
	---@type dacbui308.personal.rust.command_tbl
	depTree = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.view_dep_tree"):view_dependencies()
		end,
	},
	---@type dacbui308.personal.rust.command_tbl
	eval = {
		handler = function(_, _)
			require("dacbui308.personal.rust_analyzer.eval_function"):eval()
		end,
	},
}

---@param command_tbl dacbui308.personal.rust.command_tbl[]
---@param opts table
local function run_command(command_tbl, cmd_name, opts)
	local fargs = opts.fargs
	local cmd = fargs[1]
	local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
	local command = command_tbl[cmd]
	if type(command) ~= "table" or type(command.handler) ~= "function" then
		vim.notify(cmd_name .. ": Unknown subcommand: " .. cmd, vim.log.levels.ERROR)
		return
	end
	command.handler(args, opts)
end

---
---@param opts table
local function create_rust_cmd(opts)
	run_command(rust_lsp_cmd, "Rust", opts)
end

---@generic K, V
---@param predicate fun(V):boolean
---@param tbl table<K, V>
---@return K[]
local function tbl_keys_by_value_filter(predicate, tbl)
	local ret = {}
	for k, v in pairs(tbl) do
		if predicate(v) then
			ret[k] = v
		end
	end
	return vim.tbl_keys(ret)
end

function rust.setup(config)
	vim.api.nvim_create_user_command("Rust", create_rust_cmd, {
		nargs = "+",
		range = true,
		bang = true,
		desc = "Rust analyzer custom requests",
		complete = function(arg_lead, cmdline, _)
			local commands = cmdline:match("^['<,'>]*" .. "Rust" .. "!") ~= nil
					-- bang!
					and tbl_keys_by_value_filter(function(command)
						return command.bang == true
					end, rust_lsp_cmd)
				or vim.tbl_keys(rust_lsp_cmd)
			local subcmd, subcmd_arg_lead = cmdline:match("^['<,'>]*" .. "Rust" .. "[!]*%s(%S+)%s(.*)$")
			if subcmd and subcmd_arg_lead and rust_lsp_cmd[subcmd] and rust_lsp_cmd[subcmd].complete then
				return rust_lsp_cmd[subcmd].complete(subcmd_arg_lead)
			end
			if cmdline:match("^['<,'>]*" .. "Rust" .. "[!]*%s+%w*$") then
				return vim.tbl_filter(function(command)
					return command:find(arg_lead) ~= nil
				end, commands)
			end
		end,
	})
end

return rust
