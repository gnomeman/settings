-- im-sorry-jon: Have you ever felt like your lasagna loving cat is watching you while you sleep?
-- Clear existing highlight
vim.cmd("hi clear")

-- Colors
local colors = {
  NONE = {
    gui = "NONE",
    cterm = "NONE",
  },

  -- Blacks

  void = {
    gui = "#1c1c1c",
    cterm = 234,
  },
  obsidian = {
    gui = "#3a3a3a",
    cterm = 237,
  },
  shadow = {
    gui = "#4e4e4e",
    cterm = 239,
  },
  black = {
    gui = "#000000",
    cterm = 0,
  },

  -- Grays

  nermal = {
    gui = "#6c6c6c",
    cterm = 242,
  },
  ash = {
    gui = "#bcbcbc",
    cterm = 250,
  },

  -- Whites

  white = {
    gui = "#ffffff",
    cterm = 255,
  },

  -- Greens

  portal = {
    gui = "#00ff00",
    cterm = 46,
  },
  nausea = {
    gui = "#00d700",
    cterm = 40,
  },

  -- Blues

  cosmic = {
    gui = "#0000ff",
    cterm = 21,
  },

  -- Oranges

  lasagana = {
    gui = "#ff8700",
    cterm = 208,
  },

  -- Yellows

  odie = {
    gui = "#ffff00",
    cterm = 11,
  },

  -- Purples

  creepy = {
    gui = "#5f5fd7",
    cterm = 62,
  },
  violent = {
    gui = "#8700ff",
    cterm = 93,
  },

  -- Reds

  blood = {
    gui = "#ff0000",
    cterm = 196,
  },
  rot = {
    gui = "#d70000",
    cterm = 160,
  },
}

local function set_highlight(group, fg, bg, is_bold, is_standout, is_underlined)
  vim.api.nvim_set_hl(
    0, group, {
      fg = fg.gui,
      bg = bg.gui,
      ctermfg = fg.cterm,
      ctermbg = bg.cterm,
      bold = is_bold,
      standout = is_standout,
      underline = is_underlined,
    }
  )
end

local function _set_highlight(group, fg, bg, opts)
  local hl_opts = {
    fg = fg.gui,
    bg = bg.gui,
    ctermfg = fg.cterm,
    ctermbg = bg.cterm,
  }

  if type(opts) == "table" then
    if opts.bold then
      hl_opts.bold = true
    end

    if opts.italic then
      hl_opts.italic = true
    end

    if opts.standout then
      hl_opts.standout = true
    end

    if opts.underline then
      hl_opts.underline = true
    end
  end

  -- :help nvim_set_hl
  vim.api.nvim_set_hl(0, group, hl_opts)
end

-- Highlights
set_highlight("ColorColumn", colors.lasagana, colors.NONE, true)
_set_highlight(
  "Comment", colors.shadow, colors.NONE, {
    italic = true,
  }
)
set_highlight("Constant", colors.lasagana, colors.NONE, false)
set_highlight("CurSearch", colors.portal, colors.cosmic, true)
set_highlight("Cursor", colors.shadow, colors.NONE, true)
set_highlight("CursorColumn", colors.NONE, colors.void, true)
set_highlight("CursorLine", colors.NONE, colors.void, false)
set_highlight("CursorLineNr", colors.lasagana, colors.NONE, true)
set_highlight("Delimiter", colors.ash, colors.NONE, false)
set_highlight("DiagnosticError", colors.rot, colors.NONE, false)
set_highlight("DiagnosticInfo", colors.nermal, colors.NONE, false)
set_highlight("DiagnosticOk", colors.nausea, colors.NONE, false)
set_highlight("DiagnosticWarn", colors.odie, colors.NONE, false)
set_highlight("DiffAdd", colors.portal, colors.NONE, true)
_set_highlight(
  "DiffChange", colors.portal, colors.NONE, {
    underline = true,
  }
)
set_highlight("DiffDelete", colors.blood, colors.NONE, false)
set_highlight("Added", colors.portal, colors.NONE, true)
set_highlight("Removed", colors.blood, colors.NONE, false)
set_highlight("DiffText", colors.portal, colors.cosmic, true)
set_highlight("Directory", colors.nausea, colors.NONE, true)
set_highlight("Error", colors.ash, colors.blood, true)
set_highlight("ErrorMsg", colors.blood, colors.void, true)
set_highlight("Folded", colors.creepy, colors.NONE, true)
set_highlight("Function", colors.ash, colors.NONE, true)
set_highlight("Identifier", colors.lasagana, colors.NONE, true)
set_highlight("lCursor", colors.lasagana, colors.NONE, true)
set_highlight("LineNrAbove", colors.obsidian, colors.NONE, false)
set_highlight("LineNr", colors.portal, colors.NONE, true)
set_highlight("LineNrBelow", colors.obsidian, colors.NONE, false)
set_highlight("MatchParen", colors.portal, colors.cosmic, true)
set_highlight("MsgArea", colors.odie, colors.NONE, true)
set_highlight("Normal", colors.ash, colors.NONE, false)
set_highlight("NormalFloat", colors.lasagana, colors.NONE, false)
set_highlight("NotificationInfo", colors.lasagana, colors.shadow, false)
set_highlight("Number", colors.creepy, colors.NONE, false)
set_highlight("Operator", colors.creepy, colors.NONE, false)
set_highlight("Pmenu", colors.shadow, colors.void, false)
set_highlight("PmenuSel", colors.white, colors.blood, true)
set_highlight("PreProc", colors.lasagana, colors.NONE, true)
set_highlight("Search", colors.portal, colors.NONE, true)
set_highlight("Special", colors.lasagana, colors.NONE, false)
set_highlight("SpecialKey", colors.creepy, colors.NONE, true)
_set_highlight(
  "SpellBad", colors.blood, colors.NONE, {
    underline = true,
  }
)
_set_highlight(
  "SpellLocal", colors.lasagana, colors.NONE, {
    underline = true,
  }
)
_set_highlight(
  "SpellRare", colors.cosmic, colors.NONE, {
    underline = true,
  }
)
set_highlight("Statement", colors.lasagana, colors.NONE, true)
set_highlight("StatusLine", colors.black, colors.lasagana, true)
set_highlight("String", colors.creepy, colors.NONE, false)
set_highlight("TelescopeBorder", colors.violent, colors.NONE, true)
set_highlight("TabLine", colors.shadow, colors.void, true)
set_highlight("TabLineFill", colors.NONE, colors.void, false)
set_highlight("TabLineSel", colors.shadow, colors.lasagana, true)
set_highlight("Title", colors.lasagana, colors.NONE, true)
set_highlight("Todo", colors.blood, colors.NONE, true)
set_highlight("Type", colors.lasagana, colors.NONE, true)
_set_highlight(
  "Underlined", colors.violent, colors.NONE, {
    underline = true,
  }
)
set_highlight("Visual", colors.lasagana, colors.cosmic, true)
_set_highlight(
  "WarningMsg", colors.portal, colors.NONE, {
    italic = true,
  }
)
set_highlight("@markup.link", colors.nausea, colors.NONE, false)
set_highlight("@string.special.url", colors.creepy, colors.NONE, false)
set_highlight("TelescopeSelectionCaret", colors.portal, colors.cosmic, true)

-- Links
vim.api.nvim_set_hl(
  0, "Changed", {
    link = "DiffChange",
  }
)
