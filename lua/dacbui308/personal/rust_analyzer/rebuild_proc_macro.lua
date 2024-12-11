local M = {}
local lsp = require("dacbui308.personal.lsp")

local function handler(err, _, _)
	if err then
		vim.notify("could not rebuild proc macro")
		return
	end
end

function M:rebuild_proc_macro()
	lsp.request_lsp("rust_analyzer", "rust-analyzer/rebuildProcMacros", nil, handler)
end

return M
