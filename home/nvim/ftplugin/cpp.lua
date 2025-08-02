vim.opt.shiftwidth = 4
require "lspconfig".clangd.setup {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  cmd = {
    "{{ clangd }}",
    "--offset-encoding=utf-16"
  }
}
