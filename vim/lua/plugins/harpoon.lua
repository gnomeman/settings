local keymap = vim.keymap.set

local harpoon = require("harpoon")

keymap(
  "n", "<leader>ha", function()
    harpoon:list():add()
  end, {
    desc = "Add to harpoon list.",
  }
)
keymap(
  "n", "<leader>hl", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, {
    desc = "Show harpoon list.",
  }
)
