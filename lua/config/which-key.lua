local wk = require('which-key')

wk.setup()

local opts = {
        mode = "n",
        prefix = "<leader>",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = false,
}

wk.add({

        { '<leader>b',  group = '[B]uffer' },
        { '<leader>bn', '<Cmd>ene<CR>',                                                                  desc = '[N]ew [No name]' },
        { '<leader>bc', '<Cmd>BufDel<CR>',                                                               desc = '[C]lose' },

        { '<leader>c',  group = '[C]ode' },
        { '<leader>d',  group = '[D]ocument' },
        { '<leader>r',  group = '[R]ename' },

        { '<leader>s',  group = '[S]earch' },
        { '<leader>sh', '<Cmd>Telescope help_tags<CR>',                                                  desc = '[H]elp' },
        { '<leader>sk', '<Cmd>Telescope keymaps<CR>',                                                    desc = '[K]eymaps' },
        { '<leader>sh', '<Cmd>Telescope find_files<CR>',                                                 desc = '[F]iles' },
        { '<leader>sh', '<Cmd>Telescope builtin<CR>',                                                    desc = '[S]elect Telescope' },
        { '<leader>sh', '<Cmd>Telescope live_grep<CR>',                                                  desc = '[G]rep' },
        { '<leader>sh', '<Cmd>Telescope diagnostics<CR>',                                                desc = '[D]iagnostics' },
        { '<leader>sh', '<Cmd>Telescope resume<CR>',                                                     desc = '[R]esume' },
        { '<leader>s.', '<Cmd>Telescope oldfiles<CR>',                                                   desc = '[S]earch Recent Files ("." for repeat)' },

        { '<leader>w',  group = '[W]orkspace' },
        { '<leader>t',  group = '[T]oggle' },
        { '<leader>h',  group = 'Git [H]unk',                                                            mode = { 'n', 'v' } },


        -- Format
        { '<leader>f',  '<Cmd>lua require("conform").format { async = true, lsp_fallback = true }<CR>',  desc = '[F]ormat' },

        -- Go to
        { '<leader>g',  group = '[G]o to' },
        { '<leader>gd', '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>',                     desc = 'Lsp definition' },
        { '<leader>gv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', desc = 'Lsp definition (vsplit)' },


}, opts)
