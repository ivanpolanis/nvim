local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	{ "<leader>l", group = "Rust" },
	{ "<leader>lh", "<cmd>RustToggleInlayHints<Cr>", desc = "Toggle Hints" },
	{ "<leader>lr", "<cmd>RustRunnables<Cr>", desc = "Runnables" },
	{ "<leader>lC", "<cmd>RustRun<cr>", desc = "Run" },
	{ "<leader>lt", "<cmd>RustTest<cr>", desc = "Run test under the cursor" },
	{ "<leader>lT", "<cmd>RustTest!<cr>", desc = "Run all tests" },
	{ "<leader>lm", "<cmd>RustExpandMacro<Cr>", desc = "Expand Macro" },
	{ "<leader>lc", "<cmd>Cargo run<Cr>", desc = "Open Cargo" },
	{ "<leader>lp", "<cmd>RustParentModule<Cr>", desc = "Parent Module" },
	{ "<leader>ld", "<cmd>RustDebuggables<Cr>", desc = "Debuggables" },
	{ "<leader>lv", "<cmd>RustViewCrateGraph<Cr>", desc = "View Crate Graph" },
	{
		"<leader>lR",
		"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
		desc = "Reload Workspace",
	},
	{ "<leader>lo", "<cmd>RustOpenExternalDocs<Cr>", desc = "Open External Docs" },
}

which_key.add(mappings)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
	if msg:match("message with no corresponding") then
		return
	end

	notify_filter(msg, ...)
end

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })
