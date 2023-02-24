local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "lifepillar/vim-gruvbox8",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme gruvbox8_hard]])
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = {
        options = {
          theme = "gruvbox",
        },
      },
      dependencies = {
        "kyazdani42/nvim-web-devicons"
      }
    },
    {
      "knubie/vim-kitty-navigator",
      build = "cp ./*.py ~/.config/kitty/"
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
  },
  checker = { enabled = true },
})
