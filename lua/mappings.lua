local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_options = { noremap = true, expr = true, silent = true }

-- set leader key
map('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- dissabling arrows
map("n", "<Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)

-- better window navigation
map("n", "<C-h>", "<Cmd> TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", "<Cmd> TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", "<Cmd> TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", "<Cmd> TmuxNavigateRight<CR>", opts)

-- center search results
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", opts)

-- go to definitions

map('n', '<LEADER>gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', opts)
map('n', '<LEADER>gv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', opts)

-- buffers

map("n", "<leader>nn", ":enew<CR>", opts)
map("n", "<leader>x", "<Cmd>BufDel<CR>", opts)

-- Tab switch buffer
map("n", "<S-l>", "<Cmd>bnext<CR>", opts)
map("n", "<S-h>", "<Cmd>bprevious<CR>", opts)
map("t", "<C-S-l>", "<Cmd>bnext<CR>", opts)
map("t", "<C-S-h>", "<Cmd>bprevious<CR>", opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Resizing panes
map("n", "<A-h>", ":vertical resize +1<CR>", opts)
map("n", "<A-l>", ":vertical resize -1<CR>", opts)
map("n", "<A-k>", ":resize -1<CR>", opts)
map("n", "<A-j>", ":resize +1<CR>", opts)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

-- Move selected line / block of text in visual mode
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Remove conflicting keybinds
vim.cmd([[map <C-f> <Nop>]])

-- Smart dd
local function smart_dd()
    if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
    else
        return "dd"
    end
end
vim.keymap.set("n", "dd", smart_dd, expr_options)

-- Ctrl + backspace
vim.cmd([[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]])

-- Save on leader w
map('n', '<Leader>w', "<Cmd>w<CR>", opts)

-- Quit on leader
map('n', '<Leader>q', "<Cmd>q<CR>", opts)

-- NvimTree
map('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<Leader><Space>', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>b', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<Leader>g', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<Leader>.', "<Cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)

-- Terminal
map('n', '<Leader>tt', '<Cmd>terminal<CR>A', opts)
map('n', '<Leader>te', '<Cmd>!wezterm start --cwd "$PWD" --always-new-process & disown<CR><CR>', opts)

-- Neogit
map('n', '<Leader>gg', '<Cmd>Neogit<CR>', opts)

-- todo-comments
map('n', '<Leader>td', '<Cmd>TodoTelescope<CR>', opts)

-- lsp
map('n', '<Leader>la', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Leader>lf', '<Cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
map('n', '<Leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- dap
map('n', '<leader>dc', "<Cmd>lua require('dap').continue()<CR>", opts)
map('n', '<leader>dv', "<Cmd>lua require('dap').step_over()<CR>", opts)
map('n', '<leader>di', "<Cmd>lua require('dap').step_into()<CR>", opts)
map('n', '<leader>do', "<Cmd>lua require('dap').step_out()<CR>", opts)
map('n', '<leader>db', "<Cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
map('n', '<leader>dB', "<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')<CR>", opts)
map('n', '<leader>dr', "<Cmd>lua require('dap').repl.open()<CR>", opts)
map('n', '<leader>dl', "<Cmd>lua require('dap').run_last()<CR>", opts)
-- map('n', '<leader>dpb', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)

local virtual_lines_enabled = false
map('n', '<leader>lt', '', {
    callback = function()
        virtual_lines_enabled = not virtual_lines_enabled
        vim.diagnostic.config({
            virtual_lines = virtual_lines_enabled,
            virtual_text = not virtual_lines_enabled,
        })
    end,
})

-- treesitter context
map('n', '<leader>ct', '<Cmd>TSContextToggle<CR>', opts)

-- session managment
map('n', '<leader>ss', '<Cmd>Autosession search<CR>', opts)
map('n', '<leader>sd', '<Cmd>DeleteSession<CR>', opts)
map('n', '<leader>sr', '<Cmd>RestoreSession<CR>', opts)
map('n', '<leader>sS', '<Cmd>SaveSession<CR>', opts)

-- jot
map('n', '<leader>j', '<Cmd>Jot<CR>', opts)

-- neogen
map('n', '<leader>lg', '<Cmd>Neogen<CR>', opts)

-- nvim navbuddy
map('n', '<leader>ln', '<Cmd>Navbuddy<CR>', opts)

-- rust

map('n', '<leader>rc', ':!cargo check<CR>', opts)
map('n', '<leader>rr', ':!cargo run<CR>', opts)
map('n', '<leader>rt', ':!cargo test<CR>', opts)
