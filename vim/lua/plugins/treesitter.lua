-- Setup
require("nvim-treesitter.configs").setup(
  {
    ensure_installed = {
      "go",
      "json",
      "javascript",
      "lua",
      "python",
      "rust",
      "typescript",
      "yaml",
    },
    sync_install = false,
    auto_install = false,
    highlight = {
      enable = true,
    },
  }
)

-- Fold method based on treesitter.
vim.g.foldmethod = "nvim_treesitter#foldexpr()"
