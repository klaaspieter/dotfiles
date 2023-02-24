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

set.splitbelow = true
set.splitright = true

vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_contrast_light = "medium"

-- vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
-- vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
-- vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
-- vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
