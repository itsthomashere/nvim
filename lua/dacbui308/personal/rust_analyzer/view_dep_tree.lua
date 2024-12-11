local M = {}
local utils = require("dacbui308.personal.utils")
local lsp = require("dacbui308.personal.lsp")
local latest_buf_id = nil

---@class Dependency
---@field name string
---@field version string
---@field path string

---@class DepListResult
---@field crates Dependency[]

---@param err any
---@param result DepListResult
local function handler(err, result)
	if err then
		vim.notify("Could not view item tree: " .. tostring(err), vim.log.levels.ERROR)
		return
	end
	utils.delete_buf(latest_buf_id)
	latest_buf_id = vim.api.nvim_create_buf(false, true) -- not listed and scratch
	utils.open_split(true, latest_buf_id)
	local lines = {}
	for i, crate in vim.spairs(result.crates) do
		local here = string.format("[%s](%s). %s ", crate.name, crate.path, crate.version)
		lines[i] = here
	end
	vim.bo[latest_buf_id].filetype = "markdown"
	vim.api.nvim_buf_set_lines(latest_buf_id, 0, 0, false, lines)
	vim.bo[latest_buf_id].readonly = true
	utils.resize(true, "-40")
end

function M:view_dependencies()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	lsp.request_lsp("rust_analyzer", "rust-analyzer/fetchDependencyList", {}, handler)
end

return M
