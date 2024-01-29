local map = vim.keymap.set

map({ 'n', 'v' }, ' ', '<Nop>', { silent = true })

-- Open file explorer
map('n', '<c-e>', '<cmd>Ex<cr>', { noremap = true, desc = 'Open Explorer' })
-- Save File
map('n', '<c-s>', '<cmd>write<cr>', { noremap = true, desc = 'Save File' })
map('i', '<c-s>', '<esc><cmd>write<cr>a', { noremap = true, desc = 'Save File' })
-- Navigate splits
map('n', '<c-h>', '<c-w>h', { noremap = true, silent = true, desc = 'Navigate splits Left' })
map('n', '<c-j>', '<c-w>j', { noremap = true, silent = true, desc = 'Navigate splits Down' })
map('n', '<c-k>', '<c-w>k', { noremap = true, silent = true, desc = 'Navigate splits Up' })
map('n', '<c-l>', '<c-w>l', { noremap = true, silent = true, desc = 'Navigate splits Right' })
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open Floating Diagnostic Message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Diagnostics List' })
-- Move text up and down
map('v', 'k', ':move \'>+1<cr>gv-gv', { noremap = true, silent = true, desc = 'Move text Down' })
map('v', 'j', ':move \'<-2<cr>gv-gv', { noremap = true, silent = true, desc = 'Move text Up' })
-- Naviagate buffers
map('n', '<a-left>', '<cmd>bnext<cr>', { noremap = true, silent = true, desc = 'Navigate next buffer' })
map('n', '<a-right>', '<cmd>bprevious<cr>', { noremap = true, silent = true, desc = 'Navigate previous buffer' })
-- Modify Split Size
map('n', '<c-up>', '<cmd>resize -2<CR><cr>', { noremap = true, silent = true, desc = 'Resize split Up' })
map('n', '<c-down>', '<cmd>resize +2<CR><cr>', { noremap = true, silent = true, desc = 'Resize split Down' })
map('n', '<c-left>', '<cmd>vertical resize -2<cr>', { noremap = true, silent = true, desc = 'Resize split Left' })
map('n', '<c-right>', '<cmd>vertical resize +2<cr>', { noremap = true, silent = true, desc = 'Resize split Right' })
