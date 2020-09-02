" ====================================================================================
" 
" Name: Devastator
" Description: Vibrant color scheme inspired by the juggernaut Decepticon Transformer.
"
" ====================================================================================


" Clear highlights
highlight clear

" Clear old syntax definitions
if exists("syntax_on")
    syntax reset
endif

" Set theme name
let g:colors_name = "devastator"

function! s:set() abort
    let deepskyblue     = {"gui": "#005f5f",    "cterm":    "23"}
    let darkseagreen    = {"gui": "#d7ffaf",    "cterm":    "193"}
    let honeydew        = {"gui": "#d7ffd7",    "cterm":    "194"}
    let hotpink         = {"gui": "#d75f5f",    "cterm":    "168"}
    let deeppink        = {"gui": "#d7005f",    "cterm":    "161"}
    let cadetblue       = {"gui": "#000080",    "cterm":    "4"}
    let lightgoldenrod  = {"gui": "#d7af5f",    "cterm":    "179"}
    let cornflowerblue  = {"gui": "#5f87ff",    "cterm":    "69"}
    let salmon          = {"gui": "#FFA98C",    "cterm":    "209"}
    let darkerseagreen  = {"gui": "#afd787",    "cterm":    "150"}
    let lightpink       = {"gui": "#d7d7af",    "cterm":    "187"}
    let lightsalmon     = {"gui": "#ffaf87",    "cterm":    "175"}
    let darkestseagreen = {"gui": "#5faf5f",    "cterm":    "71"}

    " Custom color scheme
    let white           = {"gui": "#ffffff",    "cterm":    "15"}
    let obsidian        = {"gui": "#585858",    "cterm":    "240"}
    let violentviolet   = {"gui": "#af00ff",    "cterm":    "129"}
    let redlipstick     = {"gui": "#ff0000",    "cterm":    "196"}
    let turquoise       = {"gui": "#00d7ff",    "cterm":    "45"}
    let magenta         = {"gui": "#d700ff",    "cterm":    "165"}
    let neongreen       = {"gui": "#5fff5f",    "cterm":    "83"}

    let none            = {"gui": "NONE",           "cterm":    "NONE"}
    let bold            = {"gui": "bold",           "cterm":    "bold"}
    let italic          = {"gui": "italic",         "cterm":    "italic"}
    let underline       = {"gui": "underline",      "cterm":    "underline"}
    let undercurl       = {"gui": "undercurl",      "cterm":    "underline"}
    let boldcurl        = {"gui": "bold,undercurl", "cterm":    "bold,underline"}
    let boldunderline   = {"gui": "bold,underline", "cterm":    "bold,underline"}
    let bolditalic      = {"gui": "bold,italic",    "cterm":    "bold,italic"}

    let highlight_group = {}

    " General
    let highlight_group.Normal       = [honeydew, none, none, none]
    let highlight_group.Visual       = [honeydew, violentviolet, bold, none]
    let highlight_group.ColorColumn  = [none, honeydew, none, none]
    let highlight_group.SignColumn   = [deeppink, none, none, none]
    let highlight_group.IncSearch    = [neongreen, violentviolet, bold, none]
    let highlight_group.Search       = [violentviolet, neongreen, none, none]
    let highlight_group.SpecialKey   = [darkerseagreen, lightpink, none, none]
    let highlight_group.Directory    = [cornflowerblue, none, none, none]
    let highlight_group.Title        = [none, none, bold, none]
    let highlight_group.WarningMsg   = [none, lightgoldenrod, bold, none]
    let highlight_group.ErrorMsg     = [redlipstick, neongreen, bold, none]
    let highlight_group.EndOfBuffer  = [lightpink, none, bold, none]
    let highlight_group.StatusLine   = [obsidian, neongreen, bold, none]
    let highlight_group.PmenuSel     = [neongreen, cadetblue, bold, none]
    let highlight_group.Pmenu        = [white, magenta, none, none]

    " Cursor
    let highlight_group.Cursor       = [turquoise, violentviolet, bold, none]
    let highlight_group.CursorLineNr = [neongreen, none, bold, none]

    " Sidebar
    let highlight_group.LineNr       = [obsidian, none, none, none]

    " Folds
    let highlight_group.Folded       = [neongreen, violentviolet, bold, none]
    let highlight_group.MatchParen   = [neongreen, violentviolet, none, none]

    " Syntax groups
    let highlight_group.Comment      = [magenta, none, none, none]
    let highlight_group.Identifier   = [cornflowerblue, none, bold, none]
    let highlight_group.Statement    = [neongreen, none, bold, none]
    let highlight_group.Function     = [turquoise, none, bold, none]
    let highlight_group.Constant     = [violentviolet, none, none, none]
    let highlight_group.String       = [cornflowerblue, none, none, none]
    let highlight_group.Number       = [neongreen, none, none, none]
    let highlight_group.Type         = [cornflowerblue, none, bold, none]
    let highlight_group.Special      = [redlipstick, none, none, none]
    let highlight_group.PreProc      = [neongreen, none, bold, none]
    let highlight_group.Todo         = [redlipstick, none, bold, none]
    let highlight_group.Error        = [honeydew, deeppink, bold, none]
    let highlight_group.Underlined   = [turquoise, none, underline, none]

    " Tabs
    let highlight_group.TabLineSel   = [neongreen, violentviolet, bold, none]
    let highlight_group.TabLineFill  = [cornflowerblue, neongreen, none, none]
    let highlight_group.TabLine      = [violentviolet, neongreen, bold, none]
 
    " Diff
    let highlight_group.DiffAdd     = [deepskyblue, neongreen, none, none]
    let highlight_group.DiffChange  = [deepskyblue, lightgoldenrod, none, none]
    let highlight_group.DiffDelete  = [deepskyblue, hotpink, none, none]
    let highlight_group.DiffText    = [deepskyblue, darkerseagreen, none, none]

    " Spelling
    let highlight_group.SpellBad     = [redlipstick, none, underline, none]
    let highlight_group.SpellCap     = [lightpink, none, underline, none]
    let highlight_group.SpellLocal   = [neongreen, none, underline, none]
    let highlight_group.SpellRare    = [cornflowerblue, none, underline, none]

    " Coc
    let highlight_group.CocListPath = [none, white, none, none]

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
