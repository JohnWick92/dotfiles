vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
local function multicursors_clear_all()
  vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_create_namespace('nvim.multicursor'), 0, -1)
end

vim.keymap.set('n', '<leader>qq', multicursors_clear_all, { desc = 'Clear all multicursors' })

