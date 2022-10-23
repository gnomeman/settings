require("paq") {
  "savq/paq-nvim",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  -- For autocomplete
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
}

-- Load autocomplete
-- require("autocomplete")

-- Load LSP configs
require("go.lsp")
require("lua.lsp")
