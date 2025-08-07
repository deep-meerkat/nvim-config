-- Вставка пустой строки без Insert Mode
--vim.keymap.set('n', '<CR>', 'o<Esc>k')
--vim.keymap.set('n', '<S-CR>', 'O<Esc>j')

-- Выходит из файла в Netrw (explorer от Neovim)
vim.keymap.set('n', '<leader>vv', ':Ex<CR>')
-- Отключает подсветку поиска
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Открывает буфер
vim.keymap.set('n', '<leader>"', ":reg<CR>")

-- Сменить директорию на текущую
vim.keymap.set('n', '<leader>cd', function ()
  vim.cmd("silent cd %:p:h")
  local new_dir = vim.fn.getcwd()
  vim.notify(new_dir, vim.log.levels.INFO)
end, { noremap = true, desc = "Move to cwd" })

-- Перемещает строки
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Копирует из neovim в системный буфер
-- по-умол. "+yy - копирует в системный буфер
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>yy', '"+yy')

-- Вставка после курсора из системного буфера
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('v', '<leader>p', '"+p')

-- Удаление текста без сохранения в регистр!
vim.keymap.set('v', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>d', '"_d')

-- Запускает tmux-sessionizer, биндинг на будущее
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Быстрая навигация по Quick Fix
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz');
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz');
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz');
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz');

-- Shift+j перемещает нижндю строку к текущей + пробел
-- при этом курсор улетает в конец строки
-- это нужно чтобы курсор оставался на месте
-- mz - создание метки z `z - перемещение на эту метку
vim.keymap.set('n', 'J', 'mzJ`z')

-- Передвигает выделенную строку в центр экрана
-- Лучший подход при перемещении страницы вверх/вниз
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Вставка перед курсором из системного буфера
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<leader>P', '"+P')
