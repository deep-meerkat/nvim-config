return {
  cmd = { "rust_analyzer" },
  filetypes = { "rust" },
  capabilities = {
    experimental = {
      serverStatusNotification = true
    }
  },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  },
}
