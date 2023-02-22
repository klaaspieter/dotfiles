local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
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
    }
  },
  checker = { enabled = true }, -- automatically check for plugin updates
})
