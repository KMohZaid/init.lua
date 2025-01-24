-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- TODO: Do proper commenting and descriptions of below remaps/keymaps. And also add some new ones

-- Make "c" or "C" doesn't mess up with unnamed register
vim.keymap.set('n', 'c', [["_c]], { desc = 'Safe unnamed register from change cmd copy' })
vim.keymap.set('n', 'C', [["_C]], { desc = 'Safe unnamed register from change cmd copy' })

-- Safe from x now
vim.keymap.set('n', 'x', [["_x]], { desc = 'Safe unnamed register from "x" cmd cut' })

-- System clipboard with <leader>
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["+d]], { desc = 'Cut to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>D', [["+D]], { desc = 'Cut current line from cursor to end(d$ == D) into system clipboard' })
--
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]], { desc = 'Yank current line from cursor to end(y$ == Y) into system clipboard' })
--
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Paste-after from system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', [["+P]], { desc = 'Paste-before from system clipboard' })

---- select all shortcut
vim.keymap.set({ 'n', 'v' }, '<C-a>', 'gg0vG$', { desc = 'Select all (gg -> 0 -> v -> G -> $)' })

---- Esc with Ctrl+c
vim.keymap.set('n', '<C-c>', '<Esc>', { desc = 'Escape' })
