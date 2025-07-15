require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "lua_ls",
    "vue_ls",
    "pylsp",
    "html",
    "cssls",
    "marksman",
    "rust_analyzer",
    --"omnisharp",
  },
})


-- Автоматическая установка
--local lspconfig = require("lspconfig")
--
--require("mason-lspconfig").setup_handlers({
--  function(server_name)
--    lspconfig[server_name].setup({
--      capabilities = capabilities,
--      on_attach = on_attach,
--    })
--  end,
--})
