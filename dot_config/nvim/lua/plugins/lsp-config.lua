return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("lspconfig.ui.windows").default_options.border = "single"
			local capabilities = require("cmp_nvim_lsp").default_capabilites
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"pyright",
					"bashls",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							-- This will setup all servers that are in the ensure_installed list
							capabilities = capabilities
						})
					end,
				},
			})
			local lspconfig = require("lspconfig")
			lspconfig.eslint.setup({
				capabilities = capabilities
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "show [K]eymap information" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]o to [R]eference" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous LSP diagnostics message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next LSP diagnostics message" })
			vim.diagnostic.config({
				update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
				},
			})
		end,
	},
}
