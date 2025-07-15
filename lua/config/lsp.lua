local lspconfig = require('lspconfig')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- local util = require('lspconfig.util')

local vue_language_server_path = '/home/redpanda/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local vtsls_config = {
  capabilities = capabilities,
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

local vue_ls_config = {
  capabilities = capabilities,
  on_init = function(client)
    client.handlers['tsserver/request'] = function(_, result, context)
      local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
      if #clients == 0 then
        vim.notify('Could not find `vtsls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
        return
      end
      local ts_client = clients[1]

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = 'vue_request_forward',
        command = 'typescript.tsserverRequest',
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }
          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
    end
  end,
}

lspconfig.vtsls.setup(vtsls_config)
lspconfig.vue_ls.setup(vue_ls_config)

-- QML
lspconfig.qmlls.setup {
  cmd = { "qmlls", "-E" },
  filetypes = { "qml" },
  capabilities = capabilities
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
  },
  capabilities = capabilities
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
  },
  capabilities = capabilities
}

-- Rust
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  },
}

-- Haskell
lspconfig.hls.setup {
    capabilities = capabilities,
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
--  virtual_text = true,
}

-- C# (необходимо очистить Mason)
lspconfig.csharp_ls.setup {
  capabilities = capabilities,
  cmd = { '/home/redpanda/.dotnet/tools/csharp-ls' },

  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  init_options = {
    AutomaticWorkspaceInit = true
  },
  filetypes = { 'cs' },
  --  name = { 'csharp-ls' },
}

-- omnisharp
--local omnisharp_bin = "/home/redpanda/.local/share/nvim/mason/packages/omnisharp/OmniSharp"
--
--lspconfig.omnisharp.setup {
--  -- cmd = {  omnisharp_bin, "-z", "--languageserver", "--hostPID", tostring(vim.fn.getpid()), "DotNet:enablePackageRestore=false", "--encoding", "utf-8" },
--  cmd = {  omnisharp_bin },
--  capabilities = capabilities,
--  filetypes =  { "cs", "vb" },
--
--  {
--    workspace = {
--      workspaceFolders = false
--    }
--  },
-- init_options = {
--   root_dir = util.root_pattern("*.sln", "*.csproj", ".git"),
-- },
-- settings =  {
--    FormattingOptions = {
--      EnableEditorConfigSupport = true
--    },
--    MsBuild = {},
--    RenameOptions = {},
--    RoslynExtensionsOptions = {},
--    Sdk = {
--      IncludePrereleases = true
--    }
--  },
--}

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
