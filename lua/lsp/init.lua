local util = require 'lspconfig.util'

vim.lsp.config('*', {
  on_attach = function(client, bufnr)
    print("Attached to " .. client.name)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  root_markers = { '.git' }
})

--------------------
--------LSP---------
--------------------

-- lua_ls
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most
          -- likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Tell the language server how to find Lua modules same way as Neovim
          -- (see `:h lua-module-load`)
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
            -- Depending on the usage, you might want to add additional paths
            -- here.
            -- '${3rd}/luv/library'
            -- '${3rd}/busted/library'
          }
          -- Or pull in all of 'runtimepath'.
          -- NOTE: this is a lot slower and will cause issues when working on
          -- your own configuration.
          -- See https://github.com/neovim/nvim-lspconfig/issues/3189
          -- library = {
            --   vim.api.nvim_get_runtime_file('', true),
            -- }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })

-- hls
vim.lsp.config('hls', {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
})

-- csharp_ls
vim.lsp.config('csharp_ls', {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern '*.sln'(fname) or util.root_pattern '*.csproj'(fname))
  end,
})

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

-- VUE
local vue_language_server_path = '/home/redpanda/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
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
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)

-- ruff
-- vim.lsp.config('ruff', {
--   init_options = {
--     settings = {
--       -- Server settings should go here
--     }
--   }
-- })

--------------------
---enable/disable---
--------------------
vim.lsp.enable('lua_ls')
vim.lsp.enable('qmlls')
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.enable('rust_analyzer') -- возможно нужно доработать
vim.lsp.enable('hls')
vim.lsp.enable('csharp_ls')
vim.lsp.enable({'vtsls', 'vue_ls'})
vim.lsp.enable('marksman')
vim.lsp.enable('basedpyright')
vim.lsp.enable('ruff', false)

