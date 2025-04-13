-- Setup lspconfig
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local function on_attach(client, bufnr)
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	map("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	map("n", "<C-n>", '<cmd>lua vim.diagnostic.goto_next({float = {border = "rounded"}})<CR>', opts)
	map("n", "<C-p>", '<cmd>lua vim.diagnostic.goto_prev({float = {border = "rounded"}})<CR>', opts)
	map("n", "<C-i>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.foldingRange = {
	dynamicRegistration = true,
	lineFoldingOnly = true,
}

require("neodev").setup({})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				checkThirdParty = false,
			},
		},
	},
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.hls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

lspconfig.zls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlers,
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"templ",
		"vue",
		"html",
		"astro",
		"htmlangular",
		"react",
	},
})

lspconfig.marksman.setup({})

-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     handlers = handlers,
-- })
--
vim.o.signcolumn = "yes:1"
