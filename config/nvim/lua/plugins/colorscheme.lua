return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- require("gruvbox").setup({
      -- })
      -- vim.cmd([[colorscheme gruvbox]])
    end,
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
}
