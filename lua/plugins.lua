local function get_config(name)
	return function()
		require(string.format("config/%s", name))
	end
end

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	--detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },
	-- commenting with gc
	{ "numToStr/Comment.nvim", opts = {} },
	-- lua functions & utilities
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },

	-- add, delete, change surroundings
	{ "tpope/vim-surround" },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = get_config("telescope"),
	},

	-- autocompletions
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
		},
		config = get_config("cmp"),
	},

	{
		"ojroques/nvim-bufdel",
		opts = { next = "tabs", quit = true },
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = get_config("nvim-treesitter"),
	},

	-- formatter
	{
		"stevearc/conform.nvim",
		config = get_config("conform"),
	},
	{ "nvimtools/none-ls.nvim" }, -- configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim", config = get_config("null-ls") }, -- bridges gap b/w mason & null-ls

	-- lsp server manager
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = get_config("mason"),
	},

	-- lsp server configurator
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = get_config("nvim-lspconfig"),
	},
	{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports)

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		config = get_config("luasnip"),
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" }, -- useful snippets
	},

	-- nvim tree
	{
		"kyazdani42/nvim-tree.lua",
		config = get_config("nvim-tree"),
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

	-- Toggle Term

	{
		"akinsho/toggleterm.nvim",
		config = get_config("toggleterm"),
	},

	-- rust utilities
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
		version = "^5",
		lazy = false,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "v0.3.0",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},

	-- go utilities
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()',
	},
	-- others
	{ "christoomey/vim-tmux-navigator", lazy = false },

	-- markdown preview
	{
		"toppair/peek.nvim", -- Requires deno and webkit2gtk for work
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = get_config("peek"),
	},

	-- vimtex
	{
		"lervag/vimtex",
		lazy = false,
		ft = { "tex" },
		config = get_config("vimtex"),
	},

	-- ui
	{
		"akinsho/bufferline.nvim",
		config = get_config("bufferline"),
	},
	{
		"nvim-lualine/lualine.nvim",
		config = get_config("lualine"),
	},
	{
		"folke/which-key.nvim",
		cmd = "WhichKey",
		event = "VeryLazy",
		keys = { "<leader>" },
		config = get_config("which-key"),
	},

	-- typst

	{
		"chomosuke/typst-preview.nvim",
		lazy = false, -- or ft = 'typst'
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},

	-- themes
	{ "catppuccin/nvim" },
}

local opts = {
	plugins = {
		install = {
			colorscheme = { "catppuccin-mocha" },
		},
	},
	ui = {
		border = "rounded",
	},
}

require("lazy").setup(plugins, opts)
