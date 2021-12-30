require("paq") {
  "savq/paq-nvim", -- "fatih/vim-go",
  "neovim/nvim-lspconfig",
  "nvim-treesitter/nvim-treesitter"
}

-- Load LSP configs
require("go.lsp")
