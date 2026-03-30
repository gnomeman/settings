local set_highlight = require("internal.highlights").set_highlight

-- Clear existing highlight
vim.cmd("hi clear")

-- Colors
local colors = {
  NONE = {
    gui = "NONE",
    cterm = "NONE",
  },

	-- Greens

  portal_green = {
    gui = "#00ff00",
    cterm = 46,
  },
  nausea_green = {
    gui = "#00d700",
    cterm = 40,
  },

	-- Blues

  cosmic_blue = {
    gui = "#0000ff",
    cterm = 21,
  },

	-- Oranges

  lasagana_orange = {
    gui = "#ff8700",
    cterm = 208,
  },

	-- Yellows

  odie_yellow = {
    gui = "#ffff00",
    cterm = 11,
  },

	-- Purples

  creepy_purple = {
    gui = "#5f5fd7",
    cterm = 62,
  },
  violent_violet = {
    gui = "#8700ff",
    cterm = 93,
  },

	-- Reds

  blood_red = {
    gui = "#ff0000",
    cterm = 196,
  },
  rot_red = {
    gui = "#d70000",
    cterm = 160,
  },

	-- Blacks

  void_black = {
    gui = "#1c1c1c",
    cterm = 234,
  },
  obsidian_black = {
    gui = "#3a3a3a",
    cterm = 237,
  },
  shadow_black = {
    gui = "#4e4e4e",
    cterm = 239,
  },
  black = {
    gui = "#000000",
    cterm = 0,
  },

	-- Grays

  nermal_gray = {
    gui = "#6c6c6c",
    cterm = 242,
  },

	-- Whites

  ash_white = {
    gui = "#bcbcbc",
    cterm = 250,
  },
  white = {
    gui = "#ffffff",
    cterm = 255,
  },
}

-- Base styles
set_highlight("Changed", colors.portal_green, colors.NONE, {underline=true})
set_highlight("ColorColumn", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("Comment", colors.shadow_black, colors.NONE, {italic=true})
set_highlight("Constant", colors.lasagana_orange, colors.NONE)
set_highlight("CurSearch", colors.portal_green, colors.cosmic_blue, {bold=true})
set_highlight("CursorColumn", colors.portal_green, colors.cosmic_blue, {bold=true})
set_highlight("Cursor", colors.shadow_black, colors.lasagana_orange, {bold=true})
set_highlight("CursorLine", colors.portal_green, colors.cosmic_blue, {bold=true})
set_highlight("CursorLineNr", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("Delimiter", colors.ash_white, colors.NONE)
set_highlight("DiagnosticError", colors.rot_red, colors.NONE)
set_highlight("DiagnosticInfo", colors.nermal_gray, colors.NONE)
set_highlight("DiagnosticOk", colors.nausea_green, colors.NONE)
set_highlight("DiagnosticWarn", colors.odie_yellow, colors.NONE)
set_highlight("DiffAdd", colors.portal_green, colors.NONE, {bold=true})
set_highlight("DiffDelete", colors.blood_red, colors.NONE)
set_highlight("Removed", colors.blood_red, colors.NONE)
set_highlight("DiffText", colors.portal_green, colors.cosmic_blue)
set_highlight("Directory", colors.nausea_green, colors.NONE, {bold=true})
set_highlight("Error", colors.ash_white, colors.blood_red, {bold=true})
set_highlight("ErrorMsg", colors.blood_red, colors.void_black, {bold=true})
set_highlight("Folded", colors.creepy_purple, colors.NONE, {bold=false})
set_highlight("Function", colors.ash_white, colors.NONE, {bold=true})
set_highlight("Identifier", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("lCursor", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("LineNrAbove", colors.obsidian_black, colors.NONE)
set_highlight("LineNrBelow", colors.obsidian_black, colors.NONE)
set_highlight("LineNr", colors.portal_green, colors.NONE, {bold=true})
set_highlight("MatchParen", colors.portal_green, colors.cosmic_blue, {bold=true})
set_highlight("MsgArea", colors.odie_yellow, colors.NONE, {bold=true})
set_highlight("NormalFloat", colors.lasagana_orange, colors.NONE)
set_highlight("NotificationInfo", colors.lasagana_orange, colors.shadow_black)
set_highlight("Number", colors.creepy_purple, colors.NONE)
set_highlight("Operator", colors.creepy_purple, colors.NONE)
set_highlight("Pmenu", colors.shadow_black, colors.void_black)
set_highlight("PmenuSel", colors.white, colors.blood_red, {bold=true})
set_highlight("PreProc", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("Search", colors.portal_green, colors.NONE, {bold=true})
set_highlight("Special", colors.lasagana_orange, colors.NONE)
set_highlight("SpecialKey", colors.creepy_purple, colors.lasagana_orange, {bold=true})
set_highlight("SpellBad", colors.blood_red, colors.NONE, {underline=true})
set_highlight("SpellLocal", colors.lasagana_orange, colors.NONE, {underline=true})
set_highlight("SpellRare", colors.cosmic_blue, colors.NONE, {underline=true})
set_highlight("Statement", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("StatusLine", colors.black, colors.lasagana_orange, {bold=true})
set_highlight("String", colors.creepy_purple, colors.NONE)
set_highlight("TelescopeBorder", colors.violent_violet, colors.NONE, {bold=true})
set_highlight("TabLine", colors.shadow_black, colors.void_black, {bold=true})
set_highlight("TabLineFill", colors.NONE, colors.void_black)
set_highlight("TabLineSel", colors.shadow_black, colors.lasagana_orange, {bold=true})
set_highlight("Title", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("Todo", colors.blood_red, colors.NONE, {bold=true})
set_highlight("Type", colors.lasagana_orange, colors.NONE, {bold=true})
set_highlight("Underlined", colors.violent_violet, colors.NONE, {underline=true})
set_highlight("Visual", colors.lasagana_orange, colors.cosmic_blue, {bold=true})
set_highlight("WarningMsg", colors.portal_green, colors.NONE, {italic=true})
set_highlight("special.url", colors.creepy_purple, colors.NONE)

-- Links
vim.api.nvim_set_hl(
  0, "DiffChange", {
    link = "Changed",
  }
)
vim.api.nvim_set_hl(0, "Added", {link = "DiffAdd"})
vim.api.nvim_set_hl(0, "DapUILineNumber", {link = "Comment"})
