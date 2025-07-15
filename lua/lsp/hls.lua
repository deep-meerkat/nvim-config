return {
  cmd = { "haskell-language-server" },
  filetypes = { 'haskell', 'lhaskell' },
  settings = {
    haskell = {
      cabalFormattingProvider = "cabalfmt",
      formattingProvider = "ormolu"
    }
  },
  --  virtual_text = true,
}
