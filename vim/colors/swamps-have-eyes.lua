-- Clear existing highlight
vim.cmd("hi clear")

-- Colors
local colors = {
	NONE = {
		gui = "NONE",
		cterm = "NONE"
	},

	-- Blacks

	obsidian = {
		gui = "#121212",
		cterm = 233
	},
	night = {
		gui = "#262626",
		cterm = 235
	},

	-- Greens

	acid = {
		gui = "#00ff00",
		cterm = 46
	},
	cucumber = {
		gui = "#005f00",
		cterm = 22
	},
	keylime = {
		gui = "#87ff5f",
		cterm = 119
	},

	-- Greys

	charcoal = {
		gui = "#444444",
		cterm = 238
	},
	floatingfishgray = {
		gui = "#6c6c6c",
		cterm = 242
	},
	shadow = {
		gui = "#4e4e4e",
		cterm = 239
	},
	soot = {
		gui = "#6c6c6c",
		cterm = 241
	},

	-- Purples

	slate = {
		gui = "#5f5f5f",
		cterm = 60
	},

	-- Reds

	blood = {
		gui = "#ff0000",
		cterm = 194
	},

	-- Whites

	ash = {
		gui = "#dadada",
		cterm = 253
	}
}

local function set_highlight(group, fg, bg, is_bold, is_standout, is_underlined)
	vim.api.nvim_set_hl(
		0,
		group,
		{
			fg = fg.gui,
			bg = bg.gui,
			ctermfg = fg.cterm,
			ctermbg = bg.cterm,
			bold = is_bold,
			standout = is_standout,
			underline = is_underlined
		}
	)
end

local function _set_highlight(group, fg, bg, opts)
	local hl_opts = {
			fg = fg.gui,
			bg = bg.gui,
			ctermfg = fg.cterm,
			ctermbg = bg.cterm
	}

	-- TODO: Check if the key is in nvim_set_hl.parameters.val
	if type(opts) == "table" then
		if opts.bold then
			hl_opts.bold = true
		end

		if opts.standout then
			hl_opts.standout = true
		end

		if opts.underline then
			hl_opts.underline = true
		end
	end

	-- :help nvim_set_hl
	vim.api.nvim_set_hl(
		0,
		group,
		hl_opts
	)
end

-- Base styles
_set_highlight("_AlertText",               colors.blood,             colors.NONE)
_set_highlight("_AlertUnderline",          colors.blood,             colors.NONE,      {underline=true})
_set_highlight("_FadedText",               colors.charcoal,          colors.NONE)
_set_highlight("_GlowText",                colors.acid,              colors.NONE)
_set_highlight("_GlowTextBold",            colors.acid,              colors.NONE,      {bold=true})
_set_highlight("_GlowTextBoldStandout",    colors.acid,              colors.NONE,      {bold=true, standout=true})
_set_highlight("_GlowTextBoldContrastBg",  colors.obsidian,          colors.acid,      {bold=true})
_set_highlight("_GlowTextContrastBg",      colors.obsidian,          colors.acid)
_set_highlight("_GlowTextBoldDarkBg",      colors.acid,              colors.obsidian,  {bold=true})
_set_highlight("_NoGlowText",              colors.floatingfishgray,  colors.NONE)
_set_highlight("_NoGlowTextBold",          colors.floatingfishgray,  colors.NONE,      {bold=true})

-- TODO
set_highlight("CursorLine", colors.NONE, colors.NONE, false)
set_highlight("DiagnosticInfo", colors.cucumber, colors.NONE, false)
set_highlight("Label", colors.shadow, colors.NONE, true)
set_highlight("Number", colors.soot, colors.NONE, true)
set_highlight("Pmenu", colors.acid, colors.night, false)
set_highlight("Special", colors.soot, colors.NONE, true)
set_highlight("Statement", colors.slate, colors.NONE, true)
set_highlight("String", colors.soot, colors.NONE, false)
set_highlight("Type", colors.soot, colors.NONE, false)
set_highlight("Variable", colors.slate, colors.NONE, true)

-- Base style links
vim.api.nvim_set_hl(0, "Added", {link = "_GlowText"})
vim.api.nvim_set_hl(0, "Comment", {link = "_FadedText"})
vim.api.nvim_set_hl(0, "Changed", {link = "_GlowTextContrastBg"})
vim.api.nvim_set_hl(0, "CursorLineNr", {link = "_GlowTextBold"})
vim.api.nvim_set_hl(0, "Directory", {link = "_GlowText"})
vim.api.nvim_set_hl(0, "Error", {link = "_AlertText"})
vim.api.nvim_set_hl(0, "Folded", {link = "_GlowTextBoldDarkBg"})
vim.api.nvim_set_hl(0, "Function", {link = "_NoGlowTextBold"})
vim.api.nvim_set_hl(0, "Identifier", {link = "_NoGlowTextBold"})
vim.api.nvim_set_hl(0, "MatchParen", {link = "_GlowTextBoldStandout"})
vim.api.nvim_set_hl(0, "Normal", {link = "_NoGlowText"})
vim.api.nvim_set_hl(0, "StatusLine", {link = "_GlowTextBoldContrastBg"})
vim.api.nvim_set_hl(0, "Operator", {link = "_GlowTextBold"})
vim.api.nvim_set_hl(0, "Search", {link = "_GlowTextBold"})
vim.api.nvim_set_hl(0, "SpellBad", {link = "_AlertUnderline"})
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {link = "_GlowTextBoldContrastBg"})
vim.api.nvim_set_hl(0, "Visual", {link = "_GlowTextContrastBg"})

-- Inheritance
vim.api.nvim_set_hl(0, "@function.method", {link = "Function"})
vim.api.nvim_set_hl(0, "@variable", {link = "Variable"})
vim.api.nvim_set_hl(0, "Constant", {link = "Added"})
vim.api.nvim_set_hl(0, "CurSearch", {link = "MatchParen"})
vim.api.nvim_set_hl(0, "Delimiter", {link = "Added"})
vim.api.nvim_set_hl(0, "DiagnosticHint", {link = "DiagnosticInfo"})
vim.api.nvim_set_hl(0, "DiagnosticOk", {link = "DiagnosticInfo"})
vim.api.nvim_set_hl(0, "DiagnosticError", {link = "Error"})
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "DiagnosticWarn", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "DiffAdd", {link = "Added"})
vim.api.nvim_set_hl(0, "DiffDelete", {link = "Error"})
vim.api.nvim_set_hl(0, "DiffText", {link = "Visual"})
vim.api.nvim_set_hl(0, "ErrorMsg", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "Macro", {link = "Special"})
vim.api.nvim_set_hl(0, "MsgArea", {link = "Operator"})
vim.api.nvim_set_hl(0, "NvimInternalError", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidAssignment", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidBinaryOperator", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidDelimiter", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidOperator", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidUnaryOperator", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidValue", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidStringBody", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidCallingParenthesis", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "NvimInvalidStringSpecial", {link = "DiagnosticError"})
vim.api.nvim_set_hl(0, "PmenuSel", {link = "MatchParen"})
vim.api.nvim_set_hl(0, "Removed", {link = "Error"})
vim.api.nvim_set_hl(0, "TelescopeBorder", {link = "_GlowText"})
vim.api.nvim_set_hl(0, "TelescopeNormal", {link = "Normal"})
vim.api.nvim_set_hl(0, "TelescopeSelection", {link = "TelescopeNormal"})
vim.api.nvim_set_hl(0, "TelescopeTitle", {link = "TelescopeNormal"})
vim.api.nvim_set_hl(0, "Todo", {link = "Error"})
