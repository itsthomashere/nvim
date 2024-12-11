local lsp = require("dacbui308.personal.lsp")
local utils = require("dacbui308.personal.utils")

local rust = {}
local latest_buf_id = nil

local function parse_macros(result)
	local ret = {}

	local name = result.name
	local text = "// Recursive expansion of the " .. name .. " macro"
	table.insert(ret, "// " .. string.rep("=", string.len(text) - 3))
	table.insert(ret, text)
	table.insert(ret, "// " .. string.rep("=", string.len(text) - 3))
	table.insert(ret, "")

	local expansion = result.expansion
	for string in string.gmatch(expansion, "([^\n]+)") do
		table.insert(ret, string)
	end

	return ret
end

local function parse_syntax_tree(result)
	local ret = {}

	for line in string.gmatch(result, "([^\n]+)") do
		table.insert(ret, line)
	end

	return ret
end

function rust.expand_macro()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/expandMacro", params, 0, function(_, result)
		if result == nil then
			vim.notify("No macro under cursor!", vim.log.levels.INFO)
			return
		end

		-- check if a buffer with the latest id is already open, if it is then
		-- delete it and continue
		utils.delete_buf(latest_buf_id)

		-- create a new buffer
		latest_buf_id = vim.api.nvim_create_buf(false, true) -- not listed and scratch

		utils.open_split(true, latest_buf_id)

		vim.bo[latest_buf_id].filetype = "rust"
		vim.api.nvim_buf_set_lines(latest_buf_id, 0, 0, false, parse_macros(result))
		vim.bo[latest_buf_id].readonly = true

		utils.resize(true, "-25")
	end)
end

function rust.syntax_tree()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/syntaxTree", params, 0, function(_, result)
		utils.delete_buf(latest_buf_id)
		latest_buf_id = vim.api.nvim_create_buf(false, true)
		utils.open_split(true, latest_buf_id)
		vim.api.nvim_buf_set_name(latest_buf_id, "syntax.rust")
		vim.api.nvim_buf_set_text(latest_buf_id, 0, 0, 0, 0, parse_syntax_tree(result))
		utils.resize(true, "-25")
	end)
end

function rust.setup(config)
	vim.api.nvim_create_user_command("ExpandMacro", function(args)
		rust.expand_macro()
	end, { desc = "Expand macro under the cursor" })
	vim.api.nvim_create_user_command("SyntaxTree", function(args)
		rust.syntax_tree()
	end, { desc = "Expand macro under the cursor" })
end

return rust
