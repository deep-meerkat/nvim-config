local lspconfig = require('lspconfig')

local vue_language_server_path = '/home/redpanda/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server'

-- typescript
lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

-- Vue
-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup {}

-- QML
lspconfig.qmlls.setup {
  cmd = {"qmlls", "-E"}
}

-- HTML
lspconfig.html.setup {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
}

-- CSS, SCSS, LESS
lspconfig.cssls.setup {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    init_options = {
        provideFormatter = false
    },
    settings = {
        {
            css = {
                validate = true
            },
            less = {
                validate = true
            },
            scss = {
                validate = true
            }
        }
    }
}

-- Rust
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

-- Обработчик ошибок
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    -- отключает сообщение об ошибке
        virtual_text = false,
    -- отключает знаки на полях
        signs = true,
    -- отключает подчеркивание
        underline = true
    }
)
