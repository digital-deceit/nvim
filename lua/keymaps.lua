local map = vim.keymap.set

map({ 'n', 'v' }, ' ', '<Nop>', { silent = true })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit current window
map('n', '<c-q>', '<cmd>q<cr>', { noremap = true, desc = 'Close buffer' })
-- Delete buffer
map('n', '<a-d>', '<cmd>bd<cr>', { noremap = true, desc = 'Delete buffer' })
-- Open file explorer
map('n', '<a-e>', '<cmd>Ex<cr>', { noremap = true, desc = 'Open Explorer' })
-- Save File
map('n', '<c-s>', '<cmd>write<cr>', { noremap = true, desc = 'Save File' })
map('i', '<c-s>', '<esc><cmd>write<cr>a', { noremap = true, desc = 'Save File' })
-- Navigate splits
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open Floating Diagnostic Message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open Diagnostics List' })
-- Move text up and down
map('v', '<a-k>', ':move \'>+1<cr>gv-gv', { noremap = true, silent = true, desc = 'Move text Down' })
map('v', '<a-j>', ':move \'<-2<cr>gv-gv', { noremap = true, silent = true, desc = 'Move text Up' })
-- Naviagate buffers
map('n', '<a-left>', '<cmd>bnext<cr>', { noremap = true, silent = true, desc = 'Navigate next buffer' })
map('n', '<a-right>', '<cmd>bprevious<cr>', { noremap = true, silent = true, desc = 'Navigate previous buffer' })
-- Modify Split Size
map('n', '<c-up>', '<cmd>resize -2<CR><cr>', { noremap = true, silent = true, desc = 'Resize split Up' })
map('n', '<c-down>', '<cmd>resize +2<CR><cr>', { noremap = true, silent = true, desc = 'Resize split Down' })
map('n', '<c-left>', '<cmd>vertical resize -2<cr>', { noremap = true, silent = true, desc = 'Resize split Left' })
map('n', '<c-right>', '<cmd>vertical resize +2<cr>', { noremap = true, silent = true, desc = 'Resize split Right' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
