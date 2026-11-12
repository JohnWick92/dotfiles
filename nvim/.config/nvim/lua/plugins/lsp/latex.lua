vim.lsp.config("ltex_plus", {
  cmd = { "ltex-ls-plus" },
  filetypes = { "markdown", "tex", "latex", "bib", "org", "text", "gitcommit" },
  root_markers = { ".git" },
  settings = {
    ltex = {
      language = "auto",
      dictionary = {
        ["pt-BR"] = {},
        ["en-US"] = {},
      },
    },
  },
})

vim.lsp.enable("ltex_plus")
