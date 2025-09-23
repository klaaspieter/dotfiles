return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {},
      bashls = {
        filetypes = { "sh", "zsh" },
      },
    },
  },
}
