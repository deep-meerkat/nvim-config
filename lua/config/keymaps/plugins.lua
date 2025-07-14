-------------
-- PLUGINS --
-------------

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

-- BufferLine
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>')
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>')
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>')
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>')
vim.keymap.set('n', '<leader>0', ':BufferLineGoToBuffer -1<CR>')
vim.keymap.set('n', '<leader>w', ':bdelete<CR>')
vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>')
vim.keymap.set('n', '<leader><S-Tab>', ':bprevious<CR>')

-- Trouble
local trouble = require('trouble')
vim.keymap.set('n', '<leader>xx', ':Trouble diagnostics toggle<CR>', {desc = "Diagnostics (Trouble)"})
vim.keymap.set('n', '<leader>xX', ':Trouble diagnostics toggle filter.buf=0<CR>', {desc = "Buffer Diagnostics (Trouble)"})
vim.keymap.set('n', '<leader>cs', ':Trouble symbols toggle focus=false<CR>', {desc = "Symbols (Trouble)"})
vim.keymap.set('n', '<leader>cl', ':Trouble lsp toggle focus=false win.position=right<CR>', {desc = "LSP Definitions / references / ... (Trouble)"})
vim.keymap.set('n', '<leader>xL', ':Trouble loclist toggle<CR>', {desc = "Location List (Trouble)"})
vim.keymap.set('n', '<leader>xQ', ':Trouble qflist toggle<CR>', {desc = "Quickfix List (Trouble)"})
