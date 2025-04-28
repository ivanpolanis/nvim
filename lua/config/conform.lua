local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofumpt", "goimports-reviser", "golines" },
		python = { "black" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
