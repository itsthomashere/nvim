local lsp = require("dacbui308.personal.lsp")
local utils = require("dacbui308.personal.utils")

local M = {}
local latest_buf_id = nil

local function parse_syntax_tree(result)
	local ret = {}

	for line in string.gmatch(result, "([^\n]+)") do
		table.insert(ret, line)
	end

	return ret
end

local function handler(_, result)
	utils.delete_buf(latest_buf_id)
	latest_buf_id = vim.api.nvim_create_buf(false, true)
	utils.open_split(true, latest_buf_id)
	vim.api.nvim_buf_set_name(latest_buf_id, "syntax.rust")
	vim.api.nvim_buf_set_text(latest_buf_id, 0, 0, 0, 0, parse_syntax_tree(result))
	utils.resize(true, "-25")
end

function M:syntax_tree()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/syntaxTree", params, 0, handler)
end

return M
