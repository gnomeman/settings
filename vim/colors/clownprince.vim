" ====================================================================================
" 
" Name: Clown Prince
" Description: Vibrant color scheme inspired by The Clown Price of Darkness.
"
" ====================================================================================


" Clear highlights
highlight clear

" Clear old syntax definitions
if exists("syntax_on")
    syntax reset
endif

" Set theme name
let g:colors_name = "clownprince"

function! s:set() abort
    " Colors
    let abyssblue       = {"gui": "#0000ff",    "cterm":    "21"}
    let turquoise       = {"gui": "#00d7ff",    "cterm":    "45"}
    let seltzerblue     = {"gui": "#5f87ff",    "cterm":    "69"}
    let acidgreen       = {"gui": "#5fff5f",    "cterm":    "83"}
    let violentviolet   = {"gui": "#af00ff",    "cterm":    "129"}
    let germgreen       = {"gui": "#afd787",    "cterm":    "150"}
    let deeppink        = {"gui": "#d7005f",    "cterm":    "161"}
    let magenta         = {"gui": "#d700ff",    "cterm":    "165"}
    let gold            = {"gui": "#ffd700",    "cterm":    "220"}
    let lightpink       = {"gui": "#d7d7af",    "cterm":    "187"}
    let nauseousgreen   = {"gui": "#d7ffd7",    "cterm":    "194"}
    let bloodstain      = {"gui": "#ff0000",    "cterm":    "196"}
    let hotpink         = {"gui": "#ff5faf",    "cterm":    "205"}
    let obsidian        = {"gui": "#1c1c1c",    "cterm":    "234"}
    let charcoal        = {"gui": "#6c6c6c",    "cterm":    "242"}

    " Font styles
    let none            = {"gui": "NONE",           "cterm":    "NONE"}
    let bold            = {"gui": "bold",           "cterm":    "bold"}
    let underline       = {"gui": "underline",      "cterm":    "underline"}
    let italic          = {"gui": "italic",         "cterm":    "italic"}

    " Highlight
    let highlight_group = {}
    let highlight_group.ColorColumn                = [none, nauseousgreen, none, none]
    let highlight_group.Comment                    = [magenta, none, italic, none]
    let highlight_group.Constant                   = [violentviolet, none, none, none]
    let highlight_group.CursorLine                 = [none, none, none, none]
    let highlight_group.CursorLineNr               = [acidgreen, none, bold, none]
    let highlight_group.DiagnosticWarn             = [gold, none, italic, none]
    let highlight_group.DiffAdd                    = [acidgreen, none, bold, none]
    let highlight_group.DiffChange                 = [abyssblue, gold, none, none]
    let highlight_group.DiffDelete                 = [bloodstain, none, none, none]
    let highlight_group.DiffText                   = [nauseousgreen, germgreen, none, none]
    let highlight_group.Directory                  = [seltzerblue, none, none, none]
    let highlight_group.EndOfBuffer                = [lightpink, none, bold, none]
    let highlight_group.Error                      = [nauseousgreen, deeppink, bold, none]
    let highlight_group.ErrorMsg                   = [bloodstain, acidgreen, bold, none]
    let highlight_group.Folded                     = [acidgreen, violentviolet, bold, none]
    let highlight_group.Function                   = [turquoise, none, bold, none]
    let highlight_group.Identifier                 = [seltzerblue, none, bold, none]
    let highlight_group.IncSearch                  = [acidgreen, violentviolet, bold, none]
    let highlight_group.LineNr                     = [charcoal, none, none, none]
    let highlight_group.LspDiagnosticsDefaultError = [bloodstain, none, bold, none]
    let highlight_group.MatchParen                 = [acidgreen, violentviolet, none, none]
    let highlight_group.Normal                     = [nauseousgreen, none, none, none]
    let highlight_group.Number                     = [acidgreen, none, none, none]
    let highlight_group.Pmenu                      = [charcoal, obsidian, none, none]
    let highlight_group.PmenuSel                   = [obsidian, bloodstain, bold, none]
    let highlight_group.PreProc                    = [acidgreen, none, bold, none]
    let highlight_group.Search                     = [violentviolet, acidgreen, none, none]
    let highlight_group.SignColumn                 = [deeppink, none, none, none]
    let highlight_group.Special                    = [bloodstain, none, none, none]
    let highlight_group.SpecialKey                 = [violentviolet, acidgreen, bold, none]
    let highlight_group.SpellBad                   = [bloodstain, none, underline, none]
    let highlight_group.SpellCap                   = [lightpink, none, underline, none]
    let highlight_group.SpellLocal                 = [acidgreen, none, underline, none]
    let highlight_group.SpellRare                  = [seltzerblue, none, underline, none]
    let highlight_group.Statement                  = [acidgreen, none, bold, none]
    let highlight_group.StatusLine                 = [charcoal, acidgreen, bold, none]
    let highlight_group.String                     = [seltzerblue, none, none, none]
    let highlight_group.TabLine                    = [charcoal, obsidian, bold, none]
    let highlight_group.TabLineFill                = [none, obsidian, none, none]
    let highlight_group.TabLineSel                 = [charcoal, acidgreen, bold, none]
    let highlight_group.Title                      = [none, none, bold, none]
    let highlight_group.Todo                       = [bloodstain, none, bold, none]
    let highlight_group.Type                       = [seltzerblue, none, bold, none]
    let highlight_group.Underlined                 = [turquoise, none, underline, none]
    let highlight_group.Visual                     = [nauseousgreen, violentviolet, bold, none]
    let highlight_group.WarningMsg                 = [gold, none, italic, none]

    " Highlight mapping
    for [group, colors] in items(highlight_group)
        execute printf("highlight %s guifg=%s guibg=%s gui=%s, guisp=%s ctermfg=%s ctermbg=%s cterm=%s",
            \ group,
            \ colors[0]["gui"],
            \ colors[1]["gui"],
            \ colors[2]["gui"],
            \ colors[3]["gui"],
            \ colors[0]["cterm"],
            \ colors[1]["cterm"],
            \ colors[2]["cterm"]
            \ )
    endfor
endfunction

call s:set()
