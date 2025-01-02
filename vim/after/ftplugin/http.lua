local kulala = require("kulala")

-- Constants
local keymap = vim.keymap.set

---
-- Generate silent opts table.
--
-- @param desc string
-- @return table
local function opts_silent(desc)
  return {
    noremap = true,
    silent = true,
    desc = desc,
  }
end

-- Keymaps
keymap("n", "<leader>h", kulala.run, opts_silent("Execute HTTP request."))
keymap("n", "<leader>t", kulala.toggle_view, opts_silent("Toggle between body and headers."))
keymap("n", "<leader>i", kulala.inspect, opts_silent("Show command with expanded variables."))
keymap("n", "<leader>cp", kulala.copy, opts_silent("Copy the current request as a curl command."))
keymap("n", "<leader><Space>", kulala.search, opts_silent("Search named requests."))
keymap("n", "[", kulala.jump_prev, opts_silent("Previous request."))
keymap("n", "]", kulala.jump_next, opts_silent("Next request."))
