vim.pack.add({
  "https://github.com/folke/which-key.nvim",
})
vim.o.timeout = true
vim.o.timeoutlen = 300
local wk = require("which-key")
wk.setup({})
