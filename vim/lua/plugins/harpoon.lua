local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

local keymap = vim.keymap.set

-- Keymaps
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
