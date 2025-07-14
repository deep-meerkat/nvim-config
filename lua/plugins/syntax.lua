return {
  -- Mason
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  -- Language Server
  { 'neovim/nvim-lspconfig' },

  --Vsnip
  --  { 'hrsh7th/cmp-vsnip' },
  --  { 'hrsh7th/vim-vsnip' },

  -- Luasnip
  {
    "L3MON4D3/LuaSnip",
    event="InsertEnter",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },

  -- CMP
  {
    'hrsh7th/cmp-nvim-lsp',
    --    lazy=true,
  },
  {
    'hrsh7th/cmp-buffer',
    --    lazy=true,
  },
  {
    'hrsh7th/cmp-path',
    --    lazy=true,
  },
  {
    'hrsh7th/cmp-cmdline',
    --    lazy=true,
    event="CmdlineEnter"
  },
  {
    'hrsh7th/nvim-cmp',
    --    lazy=true,
  },

  -- Highlight syntax (синтаксическая подсветка)
  { 'nvim-treesitter/nvim-treesitter', event="BufRead" },

  -- Comments
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    }
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
