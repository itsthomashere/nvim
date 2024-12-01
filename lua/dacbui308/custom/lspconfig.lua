vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		vim.api.nvim_set_hl(event.buf, "CurrentWord", { undercurl = true, underline = true })
		vim.api.nvim_win_set_hl_ns(0, event.buf)

		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gr", vim.lsp.buf.references)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
		vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol)
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol)
		vim.keymap.set("n", "<leader>wfl", vim.lsp.buf.list_workspace_folders)
		vim.keymap.set("n", "<leader>wfa", vim.lsp.buf.add_workspace_folder)
		vim.keymap.set("n", "<leader>wfr", vim.lsp.buf.remove_workspace_folder)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
		vim.keymap.set("n", "<leader>lf", function()
			vim.diagnostic.setloclist({ open = false })
		end)
		vim.keymap.set({ "i", "n" }, "<C-l>", vim.lsp.buf.signature_help)

		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			vim.keymap.set("n", "<leader>h", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end)
		end

		if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(env)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = env.buf })
				end,
			})
		end
	end,
})

-- This part is for config lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
local servers = {
	lua_ls = {
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
				},
				library = vim.api.nvim_get_runtime_file("", true),
			})
		end,

		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
			},
		},
	},
	rust_analyzer = {
		cmd = {
			"rust-analyzer",
		},
		settings = {
			["rust-analyzer"] = {
				checkOnSave = true,
				check = {
					command = "clippy",
					features = "all",
					allTargets = false,
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
					features = "all",
				},
				procMacro = {
					enable = true,
				},
				imports = {
					group = {
						enable = false,
					},
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				completion = {
					postfix = {
						enable = false,
					},
					snippets = {
						custom = "None",
					},
				},
			},
		},
	},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	},
	ts_ls = {
		init_options = {
			preferences = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
				importModuleSpecifierPreference = "relative",
				importModuleSpecifierEnding = "minimal",
			},
		},
		root_dir = require("lspconfig").util.root_pattern("package.json"),
		cmd = { "typescript-language-server", "--stdio" },
		settings = {},
		single_file_support = false,
	},
	denols = {
		root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
	},
	html = {
		filetypes = { "html", "htmldjango", "tmpl", "gotmpl", "template" },
	},
	dockerls = {},
	docker_compose_language_service = {},
	clangd = {},
	wgsl_analyzer = {},
}
require("mason").setup()

local lspconfig = require("lspconfig")

for server_name, config in pairs(servers) do
	config.capabilities = vim.tbl_deep_extend("force", {}, capabilities)
	lspconfig[server_name].setup(config)
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
-- 	border = "rounded",
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
