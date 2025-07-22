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
keymap({"v", "n"}, "<leader>y", "\"+y", opts_silent("Copy"))
keymap("n", "<leader>Y", "\"+yg", opts_silent("Copy"))
keymap("n", "<leader>yy", "\"+yy", opts_silent("Copy"))

keymap({"v", "n"}, "<leader>p", "\"+p", opts_silent("Paste"))
keymap({"v", "n"}, "<leader>P", "\"+P", opts_silent("Paste"))

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
wo.number = true
o.cursorline = true	-- Have to set CursorLineNr to show line number colors

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
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "javascript", "lua", "python", "json", "yaml" },
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      callback = function()
        vim.cmd([[%s/\s\+$//e]])
      end,
    })
  end,
})

-- Filetype
cmd("filetype plugin on")
cmd("filetype indent off")

-- Terminal
keymap("t", "<leader>jk", "<C-\\><C-n>", opts_silent("Terminal: Exit"))

-- Local project files
o.exrc = true
