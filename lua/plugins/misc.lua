return {

  -- Neotree (дерево проекта)
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    cmd="Neotree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  -- Trouble (диагностика ошибок)
  {
    "folke/trouble.nvim",
    enevt="VeryLazy",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Bufferline (top navbar)
  {
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    enabled = false,
  },

  -- Hop (unmaintained) для быстрого нахождения символов
  {
    'phaazon/hop.nvim',
    lazy = true,
  },

}
