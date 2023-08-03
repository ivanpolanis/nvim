local on_attach = require("config.lsp").on_attach
local capabilities = require("config.lsp").capabilities


local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

return options
