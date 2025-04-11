require("mason").setup({
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	automatic_installation = true,
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"eslint",
		"bashls",
		"clangd",
		"gopls",
		"jsonls",
		"rust_analyzer",
		"sqlls",
		"lua_ls",
		"tsserver",
		"pyright",
		"marksman",
	},
	automatic_installation = true,
})

require("mason-null-ls").setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		-- "clang-format", -- c formatter
		"prettier", -- ts/js formatter
		-- "stylua", -- lua formatter
		-- "eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
