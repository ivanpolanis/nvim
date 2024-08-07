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
		"bashls",
		"clangd",
		"gopls",
		"jsonls",
		"rust_analyzer",
		"sqlls",
		"lua_ls",
		"tsserver",
		"pyright",
	},
	automatic_installation = true,
})
