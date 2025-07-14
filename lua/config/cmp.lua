local cmp = require'cmp'

  cmp.setup({

    -- Здесь указываем движок для сниппетов
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
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
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
      -- Использует возможности LSP
      { name = 'nvim_lsp' },
      -- Источник для сниппетов
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    },
    {
      -- Предоставляет предложения на основе буфера
      { name = 'buffer' },
    })
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

  -- Получает возводжно для LSP-клиента, которые затем передаются в lspconfig.
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['volar'].setup {
    capabilities = capabilities,
  }

  require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities,
  }

  require('lspconfig')['qmlls'].setup {
    capabilities = capabilities,
  }

--  require('lspconfig')['rust-analyzer'].setup {
--    capabilities = capabilities,
--  }


