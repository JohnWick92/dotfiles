return {
  {
    "folke/edgy.nvim",
    optional = true, -- Só altera se o edgy estiver ativado no seu LazyVim
    opts = function(_, opts)
      -- Encontra ou cria a lista de janelas posicionadas à esquerda
      opts.left = opts.left or {}

      -- Adiciona os painéis do DAP na esquerda COM títulos personalizados
      table.insert(opts.left, {
        title = "Dap Scopes",
        ft = "dapui_scopes",
      })
      table.insert(opts.left, {
        title = "Dap Breakpoints",
        ft = "dapui_breakpoints",
      })
      table.insert(opts.left, {
        title = "Dap Stacks",
        ft = "dapui_stacks",
      })
      table.insert(opts.left, {
        title = "Dap Watches",
        ft = "dapui_watches",
      })

      -- Encontra ou cria a lista de janelas posicionadas abaixo
      opts.bottom = opts.bottom or {}

      -- Adiciona o Console e o REPL na parte inferior com títulos
      table.insert(opts.bottom, {
        title = "Dap REPL",
        ft = "dap-repl",
      })
      table.insert(opts.bottom, {
        title = "Dap Console",
        ft = "dapui_console",
      })
    end,
  },
}
