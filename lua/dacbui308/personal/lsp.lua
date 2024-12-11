local lsp_utils = {}
---@param bufnr integer | nil
---@param filter vim.lsp.get_clients.Filter
---@return vim.lsp.Client[]
function lsp_utils.get_client(bufnr, filter)
	---@type vim.lsp.get_clients.Filter
	filter = vim.tbl_deep_extend("force", filter, {})
	if bufnr then
		filter.bufnr = bufnr
	end
	local clients = vim.lsp.get_clients(filter)

	return clients
end

---@param client_name string
---@param method string
---@param params table | nil
---@param handler function | nil
function lsp_utils.request_lsp(client_name, method, params, handler)
	local buf = vim.api.nvim_get_current_buf()
	return lsp_utils.buf_request_lsp(client_name, method, params, buf, handler)
end

---
---@param client_name string
---@param method string
---@param params table | nil
---@param bufnr integer | nil
---@param handler function | nil
---@return boolean
function lsp_utils.buf_request_lsp(client_name, method, params, bufnr, handler)
	if bufnr == nil or bufnr == 0 then
		bufnr = vim.api.nvim_get_current_buf()
	end
	local success = false

	local clients = lsp_utils.get_client(bufnr, { name = client_name, method = method })

	for _, client in ipairs(clients) do
		local _, _ = client.request(method, params, handler, bufnr)
		success = true
	end
	return success
end

---@param client_name string
---@param method string
---@param params table | nil
function lsp_utils.notify(client_name, method, params)
	local success = false
	local clients = lsp_utils.get_client(0, { name = client_name, method = method })
	for _, client in ipairs(clients) do
		local _, _ = client.notify(method, params)
		success = true
	end
	if not success then
		vim.notify("No rust analyzer found", vim.log.levels.ERROR)
	end
end

return lsp_utils
