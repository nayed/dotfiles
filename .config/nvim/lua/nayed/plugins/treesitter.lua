-- Autorun :TSUpdate after nvim-treesitter installation
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local spec = event.data.spec
    if spec and spec.name == 'nvim-treesitter'
        and (event.data.kind == 'install' or event.data.kind == 'update') then
      vim.cmd('TSUpdate')
    end
  end,
})

require('nvim-treesitter').install({
  'css', 'elixir', 'fish', 'go', 'html', 'javascript',
  'json', 'latex', 'lua', 'python', 'ruby', 'rust',
  'sql', 'typescript', 'vim', 'yaml'
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)
    if ok then
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
