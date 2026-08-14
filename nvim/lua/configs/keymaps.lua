-- lear highlighting on escape in normal mode
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Esc>^[[', '<Esc>^[[', { noremap = true, silent = true })

-- Go back to previus file
vim.api.nvim_set_keymap('n', '<leader>b' , ':e #<CR>', { noremap = true, silent = true })

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy selected to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+yg_', { desc = "Copy to end of line to clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>yy", '"+yy', { desc = "Copy current line to clipboard" })

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard (before cursor)" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>P", '"+P', { desc = "Paste from clipboard (before cursor)" })

