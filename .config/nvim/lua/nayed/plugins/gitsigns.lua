require('gitsigns').setup {}

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<cr>", { desc = "Open mini preview git diff" })
vim.keymap.set("n", "<leader>gj", ":Gitsigns next_hunk<cr>", { desc = "Go to next git diff" })
vim.keymap.set("n", "<leader>gk", ":Gitsigns prev_hunk<cr>", { desc = "Go to previous git diff" })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<cr>", { desc = "Git Blame to the left" })
