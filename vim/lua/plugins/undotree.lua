-- Check if plugin is installed.
if _loadout.state.plugins_just_installed then
  return
end

-- Keymaps
vim.keymap.set(
  "n", "<leader>ut", vim.cmd.UndotreeToggle, {
    desc = "Toggle undo tree.",
  }
)
