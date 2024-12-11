local lsp = require("dacbui308.personal.lsp")
local M = {}

function M:fly_check(cmd)
	local params = cmd == "run" and vim.lsp.util.make_text_document_params() or nil
	lsp.notify("rust_analyzer", "rust-analyzer/" .. cmd .. "Flycheck", params)
end

return M
