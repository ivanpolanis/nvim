vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init {
    enable = true,
    threshold = 0,
}

local use = packer.use
packer.reset()

packer.startup({function()
end})

-- put plugin config here

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
