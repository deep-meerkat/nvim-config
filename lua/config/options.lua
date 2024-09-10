-- Предотвращает автомат. загрузку типов файлов.
-- Может ускорить запуск если есть множество файлов
-- которые поддерживают разные типы файлов.
vim.g.did_load_filetypes = 1
-- Включить поддержку filetype plugins
-- vim.o.filetype_plugin_on = true
-- Форматирование текста, где
-- q - автоматически форматирует комментарии
-- r - автоматически продолжает комментарии при нажатии Enter
-- n - включает нумерованные списки
-- 1 - автоматическое форматирование при вставке
vim.g.formatoptions = "qrn1"
-- Отключает отображения режима ввода внизу экрана
vim.opt.showmode = false
-- Интервал обновления экрана в миллисекундах
-- vim.opt.updatetime = 40
-- Всегда показывает колонку для отображения значков слева
vim.wo.signcolumn = "yes"
-- Устанавливает минимальное количество строк
-- которое должно оставаться видимым сверху и снизу при прокрутке
vim.opt.scrolloff = 6
-- Отключает автоматический перенос длинных строк
vim.opt.wrap = false
-- Включает перенос длинных строк на границах слов
-- чтобы они не выходили за пределы окна
vim.wo.linebreak = true
-- Позволяет перемещать курсаор за пределы конца строки 
-- в режимах: blockwise visual selection
vim.opt.virtualedit = "block"
-- Включает сохранение истории изменений в файл undo
vim.opt.undofile = true
-- Устанавливает zsh в качестве оболочки по умолчанию
-- для выполнения команд внутри строки Neovim
vim.opt.shell = "/bin/zsh"

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
-- Позволяет использовать системный буфер обмена
--
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
-- Сокращает некоторые сообщения Neovim на экране
vim.opt.shortmess:append("c")

-- Indent Settings
-- Пробелы вместо табуляции
vim.opt.expandtab = true
-- Ширина отступа при автоматическом отступе
vim.opt.shiftwidth = 4
-- Ширина табуляции
vim.opt.tabstop = 4
-- Кол-во пробелов при нажатии на Tab
vim.opt.softtabstop = 4
-- Умный отступ пытается определить правильный уровень отступа
-- на основе синтаксиса в коде
vim.opt.smartindent = true

-- Fillchars
-- Символы для заполнения элементов интерфейса
vim.opt.fillchars = {
    -- Линия для разделения окон
    vert = "│",
    -- Символ для обозначения свертного блока кода
    fold = "⠀",
    -- Символ в конце буфера, если нет в строке других символов
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    -- Символ разделения сообщений в командной строке
    msgsep = "‾",
    -- Символы для открытых свернутых и закрытых блоков кода соответственно
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

-- Включает поддержку 24-битных цветов
vim.opt.termguicolors = true
-- Подсвечивает текущую строку
vim.opt.cursorline = true
-- Отображает непечатные символы
vim.opt.list = true
-- Настраивает непечатные символы
vim.opt.listchars = { tab = '▸ ', trail = '·' }
-- Подсветка парной скобки
vim.opt.showmatch = true
-- Включает меню автодополнения в командной строке
vim.opt.wildmenu = true

-- Подсвечивает все совпадения при поиске
vim.opt.hlsearch = true
-- Игнорирует регистр при поиске
vim.opt.ignorecase = true
-- Учитывает регистр при поиске, если в запросе есть заглавная буква
vim.opt.smartcase = true
-- Очищает подсветку номеров строк и колонки значков
-- чтобы использовать цвета по умолчанию
vim.cmd([[highlight clear LineNr]])
vim.cmd([[highlight clear SignColumn]])

-- Установка шрифтов
-- vim.opt.guifont = "Hasklug Nerd Font Propo:h18"
