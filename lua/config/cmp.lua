local cmp = require'cmp'

cmp.setup({

  -- Экспериментальная опция
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText', -- можешь настроить свой цвет
    },
  },

  -- Форматирование
  formatting = {
    format = function(entry, vim_item)
      if entry.source.name == "codeium" then
        vim_item.kind = " [Codeium]" -- или иконка ⚡
      end
      return vim_item
    end,
  },

  sorting = {

-- Определяет, насколько важен score vs priority источника.
-- Например, если priority_weight=2, то сравнение по score умножается на 2 ➔ сильнее влияет на итоговый порядок.
    priority_weight = 2,
    -- отключи сравнители, которые не используешь, для скорости
    comparators = {
      -- cmp.config.compare.offset, -- предпочитает слова ближе к курсору
      cmp.config.compare.exact, -- полные совпадения ставятся выше
      cmp.config.compare.score, -- общий рейтинг совпадения fuzzy match
      cmp.config.compare.recently_used, -- недавно использованные
      cmp.config.compare.locality, -- учитывается местоположение в буфере
      --cmp.config.compare.kind, -- сортирует по типу
      --cmp.config.compare.sort_text, -- сортировка по тексту (для LSP)
      --cmp.config.compare.length, -- предпочитает более короткие слова
      cmp.config.compare.order, -- cохраняет изначальный порядок
    },
  },

  performance = {
    -- 50-100 - быстрая реакция, без лагов
    debounce = 60, -- миллисекунды задержки запроса
    -- 20-50
    throttle = 30, -- ограничение скорости запросов
    -- 200-300
    fetching_timeout = 200, -- таймаут ожидания LSP
  },

  -- Snippet engine
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },

  -- Внешний вид высплывающих автодополнений и документации.
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Hotkeys для навигации по автодополнению
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {"i", "s"})
  }),

  -- Источники автодополнения
  sources = cmp.config.sources({
    -- Важен приоритет
    { name = 'codeium' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
})

-- Настройки для автодополнения в комадной строке при поиске [/,?,:]
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

