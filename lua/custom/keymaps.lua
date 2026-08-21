local map = vim.keymap.set

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })
map('n', '<leader>fr', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { desc = 'Find and replace word under cursor' })