return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"mfussenegger/nvim-jdtls",
		"stevearc/conform.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")

		-- Capabilities
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		-- Fidget
		require("fidget").setup()

		-- Mason
		local ensure_installed = {
			"lua_ls",
			"tsserver",
			"gopls",
			"jdtls",
			"clangd",
			"html",
			"cssls",
			"tailwindcss",
			"eslint_d",
			"luacheck",
			"bashls",
		}
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			auto_update = true,
			integrations = {
				["mason-lspconfig"] = true,
			},
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				["tsserver"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tsserver.setup({
						capabilities = capabilities,
					})
				end,
				["gopls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.gopls.setup({
						capabilities = capabilities,
						settings = {
							gopls = {
								completeFunctionCalls = true,
								analyses = {
									unreachable = true,
								},
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
							},
						},
					})
				end,
				["clangd"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.clangd.setup({
						capabilities = capabilities,
					})
				end,
				["html"] = function()
					local lspconfig = require("lspconfig")
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					lspconfig.html.setup({
						capabilities = capabilities,
					})
				end,
				["cssls"] = function()
					local lspconfig = require("lspconfig")
					capabilities.textDocument.completion.completionItem.snippetSupport = true
					lspconfig.cssls.setup({
						capabilities = capabilities,
					})
				end,
				["tailwindcss"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tailwindcss.setup({
						capabilities = capabilities,
					})
				end,
				["bashls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.bashls.setup({
						capabilities = capabilities,
					})
				end,
			},
		})

		-- Completions
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm(),
				["<C-r>"] = cmp.mapping.complete(),
				["<C-l>"] = cmp.mapping.close(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		-- Vim diagnostic configuration
		vim.diagnostic.config({
			underline = true,
			virtual_text = false,
			signs = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
			update_in_insert = false,
		})

		-- For diagnostic, definitions, declarations
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				-- Telescope keybindings
				local builtin = require("telescope.builtin")
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0, desc = "Find definition" })
				vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0, desc = "Find references" })
				-- Vim LSP remaps
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Goto declaration" })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "Goto type definition" })
				vim.keymap.set("n", "<C-]>", function()
					vim.diagnostic.open_float({ focusable = true })
				end, { desc = "Show diagnostic in a floating window" })
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					{ buffer = 0, desc = "Displays information about the symbol" }
				)
				vim.keymap.set(
					"n",
					"<Space>cr",
					vim.lsp.buf.rename,
					{ buffer = 0, desc = "Rename all references to the symbol under the cursor" }
				)
			end,
		})

		-- Autoformatting

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				cpp = { "clang-format" },
				go = { "goimports", "gofmt" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
					lsp_fallback = true,
					quiet = true,
				})
			end,
		})
	end,
}
