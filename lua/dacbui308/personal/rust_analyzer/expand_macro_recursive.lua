local lsp = require("dacbui308.personal.lsp")
local utils = require("dacbui308.personal.utils")
local M = {}
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

local function handler(err, result)
	if err then
		vim.notify("could not request expand macro: " .. err, vim.log.levels.ERROR)
	end
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
end

function M:expand_macro()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/expandMacro", params, 0, handler)
end

return M
