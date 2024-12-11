local M = {}
local lsp = require("dacbui308.personal.lsp")
local function handler(err, result)
	if err then
		vim.notify(tostring(err), vim.log.levels.ERROR)
		return
	end

	vim.notify(result, vim.log.levels.INFO)
end
function M:eval()
	local clients = lsp.get_client(0, {
		name = "rust_analyzer",
	})
	if #clients == 0 then
		return
	end
	local params = vim.lsp.util.make_position_params(0, clients[1].offset_encoding or "utf-8")
	lsp.buf_request_lsp("rust_analyzer", "rust-analyzer/interpretFunction", params, 0, handler)
end

return M
