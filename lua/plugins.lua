local function get_config(name)
	return function() require(string.format('config/%s', name)) end
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
	{ "tpope/vim-sleuth" },
	{ "numToStr/Comment.nvim", opts = {} },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }, },
		config = get_config("telescope"),
	},
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
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim",  build = 'make' },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = get_config("nvim-treesitter"),
	},
	{
		"stevearc/conform.nvim",
		config = get_config("conform"),
	},
	{
		"wiliamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = get_config("mason"),
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = get_config("nvim-lspconfig"),
	},
	{
		"folke/which-key.nvim",
		event = 'VimEnter',
		config = get_config("which-key")
	},
	{
		"L3MON4D3/LuaSnip",
		config = get_config("luasnip"),
	},
	{
		"kyazdani42/nvim-tree.lua",
		config = get_config("nvim-tree"),
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},
	{
		"echasnovski/mini.nvim",
		config = get_config("mini"),
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end
	},
	{
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	},

	{
		"akinsho/bufferline.nvim",
		config = get_config("bufferline"),
	},
	{
		"nvim-lualine/lualine.nvim",
		config = get_config("lualine"),
	},

	{ "catppuccin/nvim" } -- Catppuccin themes
}

local opts = {
	plugins = {
		install = {
			colorscheme = { "catppuccin-mocha" }
		}
	},
	ui = {
		border = "rounded"
	}
}

require('lazy').setup(plugins, opts)
