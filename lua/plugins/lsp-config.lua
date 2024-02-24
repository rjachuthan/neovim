return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"html",
					"emmet_ls",
					"jsonls",
					"cssls",
					"marksman",
					"lua_ls",
					"tsserver",
					"pyright",
				},
			})

			-- Setup language servers.
			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({}) -- pip install pyright
			lspconfig.bashls.setup({}) -- npm i -g bash-language-server
			lspconfig.html.setup({}) -- npm i -g vscode-langservers-extracted
			lspconfig.emmet_ls.setup({}) -- npm install -g emmet-ls
			lspconfig.marksman.setup({})
			lspconfig.tailwindcss.setup({}) -- npm install -g @tailwindcss/language-server
			lspconfig.jsonls.setup({}) -- npm i -g vscode-langservers-extracted
			lspconfig.tsserver.setup({}) -- npm install -g typescript typescript-language-server
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						-- Make the language server know about "vim" keyword as a Global
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				-- Enable completion triggered by <c-x><c-o>
				callback = function(event)
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					-- Creating a function to make easy keybindings
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", function()
						vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
					end, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					-- When you move your cursor, the highlights will be cleared
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		end,
	},
	-- {
	--   "artemave/workspace-diagnostics.nvim",
	--   lazy = true,
	--   config = function()
	--     require("lazy").setup({ "workspace-diagnostics.nvim" })
	--   end,
	-- },
}
