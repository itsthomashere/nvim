local M = {}
local utils = require("dacbui308.personal.utils")
local lsp = require("dacbui308.personal.lsp")

---@type integer | nil
local latest_buf_id = nil

local function handler(err, result)
	if result == nil then
		vim.notify("Could not view hir: " .. tostring(err), vim.log.levels.INFO)
		return
	end
	utils.delete_buf(latest_buf_id)
	latest_buf_id = vim.api.nvim_create_buf(false, true) -- not listed and scratch
	utils.open_split(true, latest_buf_id)
	local lines = vim.split(result, "\n")
	vim.bo[latest_buf_id].filetype = "rust"
	vim.api.nvim_buf_set_lines(latest_buf_id, 0, 0, false, lines)
	vim.bo[latest_buf_id].readonly = true
end

function M:view_hir()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local position_params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/viewHir", position_params, 0, handler)
end

return M
