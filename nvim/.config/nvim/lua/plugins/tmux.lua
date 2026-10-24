vim.pack.add({ 
  "https://github.com/alexghergh/nvim-tmux-navigation"
})
local nvim_tmux_nav = require('nvim-tmux-navigation')

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { silent = true })
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { silent = true })
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { silent = true })
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { silent = true })
