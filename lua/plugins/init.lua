return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  { "rebelot/kanagawa.nvim" },
--  {
--      "mrcjkb/haskell-tools.nvim",
--      version = '^4', -- Recommended
--      lazy = false, -- This plugin is already lazy
--  },
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
  },
-- Highlight syntax
  { 'nvim-treesitter/nvim-treesitter' },
-- Language Server
  { 'neovim/nvim-lspconfig' },
-- Mason (for easy way to install LSP server)
  { 'williamboman/mason.nvim' },
--Vsnip
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
-- CMP
  { 'hrsh7th/cmp-nvim-lsp'},
  { 'hrsh7th/cmp-buffer'},
  { 'hrsh7th/cmp-path'},
  { 'hrsh7th/cmp-cmdline' }, 
  { 'hrsh7th/nvim-cmp'},
  -- Trouble
  {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
          {
              "<leader>xx",
              "<cmd>Trouble diagnostics toggle<cr>",
              desc = "Diagnostics (Trouble)",
          },
          {
              "<leader>xX",
              "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
              desc = "Buffer Diagnostics (Trouble)",
          },
          {
              "<leader>cs",
              "<cmd>Trouble symbols toggle focus=false<cr>",
              desc = "Symbols (Trouble)",
          },
          {
              "<leader>cl",
              "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
              desc = "LSP Definitions / references / ... (Trouble)",
          },
          {
              "<leader>xL",
              "<cmd>Trouble loclist toggle<cr>",
              desc = "Location List (Trouble)",
          },
          {
              "<leader>xQ",
              "<cmd>Trouble qflist toggle<cr>",
              desc = "Quickfix List (Trouble)",
          },
      },
  },
-- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
-- Bufferline (top navbar)
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
-- Hop (unmaintained)
  { 'phaazon/hop.nvim' }
}
