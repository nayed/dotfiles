-- Must load before lua_ls attaches, since it feeds lua_ls extra
-- workspace library info (this project's runtime files, vim global, etc.)
require('lazydev').setup({})

-- Implement go to definition and declaration in lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

-- Bind signature help to <M-s> instead in insert mode
vim.keymap.set('i', '<M-s>', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })

vim.keymap.set('n', '<M-n>', function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = 'Next diagnostic' })
vim.keymap.set('n', '<M-p>', function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = 'Prev diagnostic' })

vim.diagnostic.config({
  virtual_text = true, -- show message at end of the line
  -- virtual_lines = true,  -- (Nvim 0.11+) full message on its own line, mutually exclusive with virtual_text
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '❌',
      [vim.diagnostic.severity.WARN]  = '⚠️',
      [vim.diagnostic.severity.HINT]  = '💬',
      [vim.diagnostic.severity.INFO]  = '🔎',
    },
  },
  underline = true,
  severity_sort = true,
})


vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable inlay hints',
  -- group is to avoid duplicate registration on config reload :source %
  group = vim.api.nvim_create_augroup('nayed_lsp_inlay_hints', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})


vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Enable codelens',
  -- group is to avoid duplicate registration on config reload :source %
  group = vim.api.nvim_create_augroup('nayed_lsp_codelens', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method('textDocument/codeLens') then
      vim.lsp.codelens.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    local wanted = {
      ruby = "rubocop",
      lua = "lua_ls",
      typescript = "tsgo",
      javascript = "tsgo",
      typescriptreact = "tsgo",
      javascriptreact = "tsgo",
    }

    local server = wanted[ft]
    if not server then
      return
    end

    vim.lsp.buf.format({
      bufnr = args.buf,
      filter = function(client)
        return client.name == server
      end,
    })
  end,
})

-- Enable every server in one place — add new ones to this list as you configure them
vim.lsp.enable({
  'basedpyright',
  'expert',
  'lua_ls',
  -- 'gopls',
  'ruby_lsp',
  'rubocop',
  -- 'rust_analyzer',
  'tsgo',
})
