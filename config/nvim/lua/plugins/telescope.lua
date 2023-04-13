-- Fall back to find_files when not in a git directory
-- See https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
local function project_files()
  local opts = {} -- define here if you want to define something
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require("telescope.builtin").git_files(opts)
  else
    require("telescope.builtin").find_files(opts)
  end
end

return {
  "nvim-telescope/telescope.nvim", tag = "0.1.1",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", project_files, desc = "Find Files (root dir)" },
  },
  config = function()
    require("telescope")
  end,
}
