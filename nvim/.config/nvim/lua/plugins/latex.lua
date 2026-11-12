vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
  aux_dir = "build",
  options = {
    "-pdf",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-interaction=nonstopmode",
  },
}
vim.pack.add { "https://github.com/lervag/vimtex" }
