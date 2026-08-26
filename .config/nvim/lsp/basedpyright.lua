return {
  handlers = {
    --- filter noisy notifications
    ['$/progress'] = function(err, result, ctx)
      -- just notify once
      if result.token == (vim.g.basedpyright_progress_token or result.token) then
        vim.g.basedpyright_progress_token = result.token
        vim.lsp.handlers['$/progress'](err, result, ctx)
      end
    end,
  },
}
