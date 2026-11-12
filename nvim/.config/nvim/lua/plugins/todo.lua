-- 1. Add plugins (including dependencies)
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/folke/todo-comments.nvim" },
})

-- 2. Configure the plugin (manual call)
require("todo-comments").setup({
  -- your configuration, leave empty to use defaults
})
