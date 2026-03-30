local bufnr = vim.api.nvim_get_current_buf()

-- Mappings
require("internal.keymap").base_ide_keymaps(bufnr)
