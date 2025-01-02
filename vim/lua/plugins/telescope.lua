local keymap = vim.keymap.set

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- Setup
require("telescope").setup(
  {
    defaults = {
      mappings = {
        n = {
          q = actions.close,
        },
      },
      initial_mode = "normal",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--no-ignore",
      },
    },
  }
)

-- Keymaps
keymap(
  "n", "<C-Space>", function()
    builtin.buffers(
      {
        sort_mru = true,
        select_current = true,
      }
    )
  end, {
    desc = "Lists open buffers.",
  }
)
keymap(
  "n", "<leader>fc", builtin.current_buffer_fuzzy_find, {
    desc = "Live fuzzy search inside of the currently open buffer.",
  }
)
keymap(
  "n", "<leader>ff", function()
    builtin.find_files(
      {
        follow = true,
        hidden = true,
        no_ignore = true,
      }
    )
  end, {
    desc = "Lists open buffers.",
  }
)
keymap(
  "n", "<leader>fg", builtin.live_grep, {
    desc = "Search for a string and get results live as you type.",
  }
)
keymap(
  "n", "<leader>fh", builtin.help_tags, {
    desc = "Lists available help tags and opens a new window with the relevant help.",
  }
)
keymap(
  "n", "<leader>fn", function()
    builtin.lsp_document_symbols(
      {
        symbols = "function",
      }
    )
  end, {
    desc = "Lists LSP document symbols in the current buffer.",
  }
)
keymap(
  "n", "<leader>fz", builtin.spell_suggest, {
    desc = "Lists spelling suggestions for the current word under the cursor.",
  }
)
