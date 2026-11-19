vim.pack.add { "https://github.com/olexsmir/gopher.nvim" }

-- NOTE: .setup() is completely optional; only required if you want to change plugin options
require("gopher").setup {}

-- (optional) update the plugin's dependencies on updates
vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "*",
  callback = function(ev)
    if ev.data.spec.name == "gopher.nvim" and vim.tbl_contains({ "install", "update" }, ev.data.kind) then
      vim.cmd.GoInstallDeps()
    end
  end
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function(ev)
    vim.keymap.set("n", "<C-e>", "<cmd>GoIfErr<cr>", {
      buffer = ev.buf,
      silent = true,
      desc = "Adicionar bloco if err",
    })
  end,
})
