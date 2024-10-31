vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<leader>lf", function()
			vim.diagnostic.setloclist({ open = false })
		end, "Set loclist")
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			map("<leader>h", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), client.buf)
			end, "[T]oggle Inlay [H]ints")
		end
		client.server_capabilities.semanticTokensProvider = nil
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
					library = {
						vim.env.VIMRUNTIME,
					},
				},
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
-- vim.lsp.handlers["textDocument/signatureHelp"] =
-- 	vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
