local M = {}
local lsp = require("dacbui308.personal.lsp")
local function handler(err, _, _)
	if err then
		vim.notify(tostring(err), vim.log.levels.ERROR)
		return
	end
end

function M:reload_workspace()
	vim.notify("Reloading Cargo Workspace")
	lsp.request_lsp("rust_analyzer", "rust-analyzer/reloadWorkspace", nil, handler)
end

return M
