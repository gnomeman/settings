local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local g = vim.g
local keymap = vim.keymap.set

local opts_silent = require("internal.keymap").opts_silent

-- Map leader key
g.mapleader = ","

-- Swap files
o.swapfile = true

-- Escape using jk
keymap("i", "jk", "<Esc>", opts_silent("\"Just kidding\" or escape"))

-- Clipboard
o.clipboard = o.clipboard .. "unnamedplus"
keymap(
  {
    "v",
    "n",
  }, "<leader>y", "\"+y", opts_silent("Copy")
)
keymap("n", "<leader>Y", "\"+yg", opts_silent("Copy"))
keymap("n", "<leader>yy", "\"+yy", opts_silent("Copy"))

keymap(
  {
    "v",
    "n",
  }, "<leader>p", "\"+p", opts_silent("Paste")
)
keymap(
  {
    "v",
    "n",
  }, "<leader>P", "\"+P", opts_silent("Paste")
)

-- Colors
o.termguicolors = true

-- Change colorscheme based on time of day
local current_hour = os.date("*t").hour
local COLORSCHEME_DAY_TIME = 8
local COLORSCHEME_NIGHT_TIME = 20
if current_hour < COLORSCHEME_DAY_TIME or current_hour > COLORSCHEME_NIGHT_TIME then
  cmd.colorscheme("swamps-have-eyes")
else
  cmd.colorscheme("im-sorry-jon")
end

-- Line numbers
vim.opt.relativenumber = true
wo.number = true
-- o.cursorline = true -- Have to set CursorLineNr to show line number colors

-- Cursor
o.virtualedit = "onemore"
keymap("n", "j", "gj", opts_silent("Go to the next line down, even if wrapped."))
keymap("n", "k", "gk", opts_silent("Go to the next line up, even if wrapped."))
o.mouse = ""

-- Search configuration
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"
o.incsearch = true

-- Autocomplete
o.completeopt = "menuone,longest,noselect,noinsert"
-- Disable annoying autoindent
o.indentkeys = ""

-- Spacing
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

-- Remove trailing whitespace
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = {
      "go",
      "javascript",
      "lua",
      "python",
      "json",
      "yaml",
    },
    callback = function()
      vim.api.nvim_create_autocmd(
        "BufWritePre", {
          buffer = 0,
          callback = function()
            vim.cmd([[%s/\s\+$//e]])
          end,
        }
      )
    end,
  }
)

-- Filetype
cmd("filetype plugin on")
cmd("filetype indent off")

-- Terminal
keymap("t", "<leader>jk", "<C-\\><C-n>", opts_silent("Terminal: Exit"))

-- Local project files
o.exrc = true

-- Navigate and manipulate splits
keymap("n", "<c-k>", "<c-w><up>", opts_silent("Navigate up split"))
keymap("n", "<c-j>", "<c-w><down>", opts_silent("Navigate down split"))
keymap("n", "<c-l>", "<c-w><right>", opts_silent("Navigate right split"))
keymap("n", "<c-h>", "<c-w><left>", opts_silent("Navigate left split"))
keymap("n", "<leader>==", "5<c-w>+", opts_silent("Increase split height +"))
keymap("n", "<leader>--", "5<c-w>-", opts_silent("Increase split height -"))
keymap("n", "<leader>..", "5<c-w>>", opts_silent("Increase split width >"))
keymap("n", "<leader>,,", "5<c-w><", opts_silent("Increase split width <"))

-- Navigate tabs
keymap("n", "<leader>ta", ":tabnew<CR>", opts_silent("Append new tab"))
keymap("n", "<leader>tn", ":tabnext<CR>", opts_silent("Go to next tab"))
keymap("n", "<leader>tp", ":tabprevious<CR>", opts_silent("Go to previous tab"))

-- Large files
-- Define the threshold for a "large file" in bytes (1 GB)
local LARGE_FILE_THRESHOLD = 1024 * 1024 * 1024

-- Function to apply the large file settings
local function large_file_setup()
  -- Check if the current buffer's file size exceeds the threshold
  -- The vim.fn.getfsize() function returns -2 if the file is too large to check
  -- or if the file doesn't exist. We treat -2 as 'too large'.
  local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

  if file_size >= LARGE_FILE_THRESHOLD or file_size == -2 then
    -- 1. No swap files
    vim.bo.swapfile = false
    -- 2. No line wrapping
    vim.bo.wrap = false
    -- 3. No syntax highlighting, filetype processing etc.
    -- This adds 'FileType' to the list of ignored events for the current buffer
    -- (The original script used a global option, this is a safer buffer-local approach)
    vim.opt_local.eventignore:append('FileType')
    -- 4. Save memory when other file is viewed
    vim.bo.bufhidden = 'unload'
    -- 5. No undo possible
    vim.bo.undolevels = -1

    -- Display message (using nvim_echo for persistent notification)
    local msg = ('The file is larger than %s MB, so some options are changed.'):format(
      LARGE_FILE_THRESHOLD / 1024 / 1024
    )
    -- This will echo the message when the autocommand runs, which is after BufReadPre
    vim.api.nvim_echo({{msg, 'Error'}}, true, {})
  end
end

-- Create the autocommand group
local large_file_group = vim.api.nvim_create_augroup('LargeFile', {clear = true})

-- Setup the autocommand:
-- On 'BufReadPre' (before reading the file into the buffer) for all files ('*'),
-- call the large_file_setup function.
vim.api.nvim_create_autocmd('BufReadPre', {
  group = large_file_group,
  pattern = '*',
  callback = large_file_setup,
})
