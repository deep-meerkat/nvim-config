-- Should be set before Plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("config.keymaps")
require("config.options")

-- Plugins config
require("lsp")
require("config.mason")
require("config.cmp")
require("config.rose_pine")
require("config.treesitter")
require("config.telescope")
require("config.hop")
require("config.trouble")
require("config.autocmds")
--require("config.which-key")
--require("config.bufferline")
-- require("config.nightfox")
-- require("config.kanagawa")
