require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "rust", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

	sync_install = false,

	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = {},

	highlight = {
		enable = true,
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = { enable = true },
	autopairs = { enable = true },
	autotag = { enable = true },
})
