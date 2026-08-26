vim.o.background = "light"
require("gruvbox").setup({
  transparent_mode = true,
})
vim.cmd([[colorscheme gruvbox]])

-- shared palette
local bg        = "#fbf1c7" -- gruvbox light bg0 (fzf-lua)
local lsp_bg    = "#f2e5bc" -- gruvbox light bg1, one shade darker (LSP floats)
local border_fg = "#7c6f64"
local text_fg   = "#282828"

local function set_custom_hl()
  -- fzf-lua (uses its own groups, untouched by LSP floats)
  vim.api.nvim_set_hl(0, "FzfLuaNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaBorder", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaTitle", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaCursorLine", { fg = text_fg, bold = true })
  vim.api.nvim_set_hl(0, "FzfLuaPreviewNormal", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaScrollBorderEmpty", { bg = bg })
  vim.api.nvim_set_hl(0, "FzfLuaScrollBorderFull", { bg = bg })

  -- LSP floats (hover, signature help, diagnostics) — these all use
  -- NormalFloat/FloatBorder by default, no per-call config needed
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = lsp_bg })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = lsp_bg, fg = border_fg })

  -- Misc
  vim.api.nvim_set_hl(0, "WinSeparator", {
    -- bg = bg,
    fg = "#005f5f",
    bold = true,
  })
end

set_custom_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = set_custom_hl,
})

-- optional: rounded borders, purely cosmetic, no winhighlight needed
vim.o.winborder = "rounded" -- Neovim 0.11+

vim.api.nvim_set_hl(0, 'LspInlayHint', {
  fg = '#607d8b',
  -- bg = '#ebdbb2',
  -- bg = '#ffeec4',
  bg = '#ffe5b9',
  italic = true,
})
