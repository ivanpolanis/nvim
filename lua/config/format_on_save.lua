local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    sh = formatters.shfmt,
    lua = formatters.lsp,
    c = formatters.lsp,
    },

  run_with_sh = true,
})
