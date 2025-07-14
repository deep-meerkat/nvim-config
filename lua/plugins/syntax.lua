return {
  -- Mason
  {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  -- Language Server
  { 'neovim/nvim-lspconfig' },

  --Vsnip
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },

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
  },
  {
    'hrsh7th/nvim-cmp',
    --    lazy=true,
  },

-- Highlight syntax (синтаксическая подсветка)
  { 'nvim-treesitter/nvim-treesitter' },

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
