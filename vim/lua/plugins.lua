require("paq") {
  "savq/paq-nvim", -- "fatih/vim-go",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
}

-- Load autocomplete
-- require("autocomplete")

-- Load LSP configs
require("go.lsp")
require("lua.lsp")
