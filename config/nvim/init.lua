require("config.lazy")

local set = vim.opt

set.number = true
set.tabstop = 2 
set.shiftwidth = 0
set.expandtab = true
set.smartindent = true
set.undofile = true
set.termguicolors = true

set.list = true
set.listchars = { tab = "▸ ", eol = "¬", trail = "." }

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "medium"
