local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local g = vim.g
local set_keymap = vim.api.nvim_set_keymap

-- Constants
local LEADER = "<leader>"
local NOREMAP_TRUE = {
  noremap = true
}

-- Map leader to space
g.mapleader = ","

-- Swap files
o.swapfile = true

-- Escape using jk
set_keymap("i", "jk", "<Esc>", NOREMAP_TRUE)

-- Clipboard
o.clipboard = o.clipboard .. "unnamedplus"
set_keymap("v", LEADER .. "y", "\"+y", NOREMAP_TRUE)
set_keymap("n", LEADER .. "y", "\"+y", NOREMAP_TRUE)
set_keymap("n", LEADER .. "Y", "\"+yg", NOREMAP_TRUE)
set_keymap("n", LEADER .. "yy", "\"+yy", NOREMAP_TRUE)

set_keymap("v", LEADER .. "p", "\"+p", NOREMAP_TRUE)
set_keymap("v", LEADER .. "P", "\"+P", NOREMAP_TRUE)
set_keymap("n", LEADER .. "p", "\"+p", NOREMAP_TRUE)
set_keymap("n", LEADER .. "P", "\"+P", NOREMAP_TRUE)

-- Colors
o.termguicolors = true
cmd("colorscheme clownprince")

-- Line numbers
wo.number = true
cmd("set cursorline!") -- Have to set CursorLineNr to show line number colors

-- Cursor
o.virtualedit = "onemore"

-- Search configuration
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"
o.incsearch = true

-- Autocomplete
o.completeopt = "menuone,longest,noselect,noinsert"

-- Spacing
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- Remove trailing whitespace
cmd("autocmd FileType golang,javascript,lua,python autocmd BufWritePre <buffer> %s/\\s\\+$//e")
