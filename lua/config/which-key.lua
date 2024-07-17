require('which-key').setup({
        plugins = {
                marks = true,
                registers = true,
        },
        keys = { 
                {'<leader>.',
                function()
                        require('which-key').show({global = false})
                end,
                desc = "Buffer Local keymaps",},
        }
})

local wk = require('which-key')

local default_options = { noremap = true, silent = true }

wk.add({
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
} )
