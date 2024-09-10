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
  --  { "nvim-treesitter/nvim-treesitter" },
  {
      "mrcjkb/haskell-tools.nvim",
      version = '^4', -- Recommended
      lazy = false, -- This plugin is already lazy
  }
}
