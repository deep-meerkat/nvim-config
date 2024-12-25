vim.g.mapleader = " "

-- Отключает подсветку поиска
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- Открывает буфер
vim.keymap.set('n', '"', ":reg<CR>")

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal toggle<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal toggle<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status toggle<CR>')

-- Splits
vim.keymap.set('n', '|', ':vsplit<CR>')
vim.keymap.set('n', '\\', ':split<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files,   { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,    { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string,  { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics,  { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,      { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fs', builtin.builtin,      { desc = '[F]ind [S]elect Telescope' })
vim.keymap.set('n', '<leader>fr', builtin.resume,       { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps,      { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,    { desc = '[F]ind [R]esume' })
