local keymap = vim.keymap.set
local opts_silent = require("internal.keymap").opts_silent

local kulala = require("kulala")
local kulala_ui = require("kulala.ui")

-- Keymaps
keymap("n", "<leader>h", kulala.run, opts_silent("Execute HTTP request."))
keymap("n", "<leader>t", kulala.toggle_view, opts_silent("Toggle between body and headers."))
keymap("n", "<leader>i", kulala.inspect, opts_silent("Show command with expanded variables."))
keymap("n", "<leader>cp", kulala.copy, opts_silent("Copy the current request as a curl command."))
keymap("n", "<leader><Space>", kulala.search, opts_silent("Search named requests."))
keymap("n", "[", kulala.jump_prev, opts_silent("Previous request."))
keymap("n", "]", kulala.jump_next, opts_silent("Next request."))
keymap("n", "<", kulala_ui.show_previous_tab, opts_silent("Previous tab"))
keymap("n", ">", kulala_ui.show_next_tab, opts_silent("Next tab"))

-- Template for new file
-- Check if file doesn't exist on disk yet
local buf = 0
local file_path = vim.api.nvim_buf_get_name(buf)
local is_new_file = vim.fn.filereadable(file_path) == 0

-- Check if the buffer is currently empty (1 line containing empty string)
local is_empty = vim.api.nvim_buf_line_count(buf) == 1 and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""

if is_new_file and is_empty then
  -- Insert shebang and blank line
  vim.api.nvim_buf_set_lines(
    buf, 0, -1, false, {
      "# @kulala-vscode-restclient-compat",
      "",
    }
  )
  vim.api.nvim_buf_set_lines(
    buf, 1, -1, false, {
      "",
      "",
    }
  )
  vim.api.nvim_buf_set_lines(
    buf, 2, -1, false, {
      "###",
      "",
    }
  )
  vim.api.nvim_buf_set_lines(
    buf, 3, -1, false, {
      "",
      "",
    }
  )

  -- Place cursor on line 2
  vim.api.nvim_win_set_cursor(
    0, {
      5,
      0,
    }
  )
end
