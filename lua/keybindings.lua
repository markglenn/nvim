vim.keymap.set('n', '<Leader>p', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>')

-- Window navigation shortcuts for Ctrl-<direction> instead of Crtl-w <direction>
vim.keymap.set({'n', 'v', 'i'}, '<C-h>', '<C-w>h')
vim.keymap.set({'n', 'v', 'i'}, '<C-j>', '<C-w>j')
vim.keymap.set({'n', 'v', 'i'}, '<C-k>', '<C-w>k')
vim.keymap.set({'n', 'v', 'i'}, '<C-l>', '<C-w>l')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-S-p>', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>be', builtin.buffers, {})
