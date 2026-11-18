vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsStartingInstall',
  callback = function()
    vim.schedule(function()
      print 'mason-tool-installer is starting'
    end)
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'MasonToolsUpdateCompleted',
  callback = function(e)
    vim.schedule(function()
      local installed = e.data

      if installed and not vim.tbl_isempty(installed) then
        print(vim.inspect(installed)) -- print the table that lists the programs that were installed
      end
    end)
  end,
})

require('mason-tool-installer').setup {
  ensure_installed = {
    -- LSPs
    'basedpyright',
    'expert',
    'ltex-ls-plus',
    'lua-language-server',
    'ruby-lsp',
    'tsgo',

    -- DAP

    -- Linters
    'rubocop',

    -- Formatters
  },

  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
}
