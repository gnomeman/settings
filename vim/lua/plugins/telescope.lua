local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local egrep_actions = require("telescope._extensions.egrepify.actions")

local keymap = vim.keymap.set

-- Setup
telescope.setup(
  {
    defaults = {
      path_display = { "filename_first" },
      mappings = {
        n = {
          q = actions.close,
          ["K"] = actions.results_scrolling_up,
          ["J"] = actions.results_scrolling_down,
        },
      },
      initial_mode = "normal",
      vimgrep_arguments = {
        "rg",
        "--follow",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--no-ignore",
      },
      -- file_sorter = require('telescope.sorters').get_fzy_file_sorter({ follow = true }),
      -- generic_sorter = require('telescope.sorters').get_fzy_generic_sorter({ follow = true })
    },
    extensions = {
      egrepify = {
        -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
        -- if str1 and str2 are consecutively in line with anything in between (wildcard)
        AND = true,                     -- default
        permutations = false,           -- opt-in to imply AND & match all permutations of prompt tokens
        lnum = true,                    -- default, not required
        lnum_hl = "EgrepifyLnum",       -- default, not required, links to `Constant`
        col = false,                    -- default, not required
        col_hl = "EgrepifyCol",         -- default, not required, links to `Constant`
        title = true,                   -- default, not required, show filename as title rather than inline
        filename_hl = "EgrepifyFile",   -- default, not required, links to `Title`
        results_ts_hl = true,           -- set to false if you experience latency issues!
        -- suffix = long line, see screenshot
        -- EXAMPLE ON HOW TO ADD PREFIX!
        prefixes = {
          -- ADDED ! to invert matches
          -- example prompt: ! sorter
          -- matches all lines that do not comprise sorter
          -- rg --invert-match -- sorter
          ["!"] = {
            flag = "invert-match",
          },
          -- HOW TO OPT OUT OF PREFIX
          -- ^ is not a default prefix and safe example
          ["^"] = false
        },
        -- default mappings
        mappings = {
          i = {
            -- toggle prefixes, prefixes is default
            ["<C-z>"] = egrep_actions.toggle_prefixes,
            -- toggle AND, AND is default, AND matches tokens and any chars in between
            ["<C-a>"] = egrep_actions.toggle_and,
            -- toggle permutations, permutations of tokens is opt-in
            ["<C-r>"] = egrep_actions.toggle_permutations,
          }
        }
      }
    }
  }
)

-- Load extensions
require("telescope").load_extension("egrepify")

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
  "n", "<leader>fg", builtin.grep_string, {
    desc = "Searches for the string under your cursor or the visual selection in current working dir.",
  }
)
keymap(
  "n", "<leader>fl", builtin.live_grep, {
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
        symbols = {
          "function",
          "method",
        },
      }
    )
  end, {
    desc = "Lists LSP document symbols in the current buffer.",
  }
)
keymap(
  "n", "<leader>fr", builtin.resume, {
    desc = "Opens the previous picker in the identical state.",
  }
)
keymap(
  "n", "<leader>fz", builtin.spell_suggest, {
    desc = "Lists spelling suggestions for the current word under the cursor.",
  }
)
