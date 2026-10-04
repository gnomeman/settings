-- Native
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

-- 3rd Party
vim.pack.add(
  {
    -- Dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-neotest/nvim-nio",
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
      version = "main",
    },
    -- Git
    "https://github.com/tpope/vim-fugitive",
    -- Autocomplete
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    -- Debugger
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/rcarriga/nvim-dap-ui",
    "https://github.com/leoluz/nvim-dap-go",
    -- Rust
    "https://github.com/mrcjkb/rustaceanvim",
    -- Telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/fdschmidt93/telescope-egrepify.nvim",
    -- Snippets
    "https://github.com/hrsh7th/vim-vsnip",
    "https://github.com/hrsh7th/vim-vsnip-integ",
    "https://github.com/hrsh7th/cmp-vsnip",
    "https://github.com/rafamadriz/friendly-snippets",
    -- HTTP request
    "https://github.com/mistweaverco/kulala.nvim",
    -- Database
    "https://github.com/tpope/vim-dadbod",
    "https://github.com/kristijanhusak/vim-dadbod-ui",
    "https://github.com/kristijanhusak/vim-dadbod-completion",
    -- Quality of life
    "https://github.com/xero/evangelion.nvim",
    "https://github.com/miversen33/sunglasses.nvim",
  }
)

-- Load specific plugins logic.
require("plugins.cmp")
require("plugins.dadbodui")
require("plugins.kulala")
require("plugins.sunglasses")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.undotree")
require("plugins.vsnip")
