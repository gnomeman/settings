-- TODO: Use autocmd to clean up logic. For example, load plugin configs after all plugins are installed.

-- Use _loadout for loading configs initially, then remove it.
rawset(
  _G, "_loadout", {
    plugins = {
      -- Dependencies
      "savq/paq-nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      {
				"nvim-treesitter/nvim-treesitter",
				branch = "main"
			},
			-- AI
			"olimorris/codecompanion.nvim",
      -- Git
      "tpope/vim-fugitive",
      -- Autocomplete
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      -- Debugger
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      -- Rust
      "mrcjkb/rustaceanvim",
      -- Telescope
      "nvim-telescope/telescope.nvim",
			"fdschmidt93/telescope-egrepify.nvim",
      -- Snippets
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
      "hrsh7th/cmp-vsnip",
      "rafamadriz/friendly-snippets",
      -- HTTP request
      "mistweaverco/kulala.nvim",
      -- Database
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      -- Undo
      "mbbill/undotree",
      -- Quality of life
      "miversen33/sunglasses.nvim",
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
    state = {},
  }
)

-- Load local machine logic.
local path_local_machine = os.getenv("NVIM_PATH_LOCAL_MACHINE")
if path_local_machine then
  require(path_local_machine)
end

require("settings")
require("plugins")
if _loadout.state.plugins_just_installed then
  -- Restart is required after plugins are initially installed.
  return
end

require("ide")

-- Remove _loadout.
rawset(_G, "_loadout", nil)
