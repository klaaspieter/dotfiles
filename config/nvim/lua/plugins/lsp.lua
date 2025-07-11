local lspconfig = require("lspconfig")

return {
  "neovim/nvim-lspconfig",
  opts = {
    bashls = {
      filetypes = { "sh", "zsh" },
    },
  },
}
