require("paq")(
  {
    -- Dependencies
    "savq/paq-nvim",
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
    -- Git
    "tpope/vim-fugitive",
    -- Autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    -- Debugger
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    -- Telescope
    "nvim-telescope/telescope.nvim",
    -- Snippets
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "hrsh7th/cmp-vsnip",
    -- HTTP request
    "mistweaverco/kulala.nvim",
    -- Database
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
    -- Quality of life
    "miversen33/sunglasses.nvim",
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    },
  }
)

require("plugins.kulala")
require("plugins.snippets")
require("plugins.sunglasses")
require("plugins.telescope")
