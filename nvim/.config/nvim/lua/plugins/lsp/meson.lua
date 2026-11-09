vim.api.nvim_create_autocmd("FileType", {
  pattern = "meson",
  callback = function(args)
    vim.lsp.start({
      name = "mesonlsp",
      cmd = { "mesonlsp", "--lsp" },
      root_dir = vim.fs.root(args.buf, { "meson.build", ".git" }),
    })
  end,
})
