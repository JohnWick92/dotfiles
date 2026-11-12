vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

-- 1. Load custom server configs BEFORE mason-lspconfig enables them
require('plugins.lsp.lua_ls')
require('plugins.lsp.java')
require('plugins.lsp.meson')
require('plugins.lsp.latex')

-- 2. Configure global diagnostics display
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'gopls', 'clangd' },
  automatic_enable = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf

    if not client then return end

    -- Native completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = false,
      })
    end

    -- Inlay hints (shows parameter names and inferred types inline)
    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- CodeLens (shows references and actions above functions)
    if client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.refresh({ bufnr = bufnr })
    end

    -- Document color (highlights hex/rgb color codes)
    if client:supports_method('textDocument/documentColor') then
      vim.lsp.document_color.enable(true, { bufnr = bufnr })
    end

    -- LSP-based code folding
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win].foldmethod = 'expr'
      vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    -- Toggle inlay hints on/off quickly
    vim.keymap.set('n', '<leader>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
    end, opts)

    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

    vim.keymap.set('i', '<C-Space>', function()
      vim.lsp.completion.get()
    end, opts)
  end,
})
