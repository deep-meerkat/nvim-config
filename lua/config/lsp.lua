local lspconfig = require('lspconfig')

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
