" ====================================================================================
" 
" Name: im-sorry-jon
" Description: Have you ever felt like your lasagana loving cat is watching you while
" you sleep?
"
" ====================================================================================


" Clear highlights
highlight clear

" Clear old syntax definitions
if exists("syntax_on")
    syntax reset
endif

" Set theme name
let g:colors_name = "imsorryjon"

function! s:set() abort
    " Colors
    let portal_green            = {"gui": "#00ff00",  "cterm": "46"}
    let nausea_green            = {"gui": "#00d700",  "cterm": "40"}
    let cosmic_blue             = {"gui": "#0000ff",  "cterm": "21"}
    let lasagana_orange         = {"gui": "#ff8700",  "cterm": "208"}
    let odie_yellow             = {"gui": "#ffff00",  "cterm": "11"}
    let creepy_purple           = {"gui": "#5f5fd7",  "cterm": "62"}
    let violent_violet          = {"gui": "#8700ff",  "cterm": "93"}
    let blood_red               = {"gui": "#ff0000",  "cterm": "196"}
    let rot_red                 = {"gui": "#d70000",  "cterm": "160"}
    let void_black              = {"gui": "#1c1c1c",  "cterm": "234"}
    let obsidian_black          = {"gui": "#3a3a3a",  "cterm": "237"}
    let shadow_black            = {"gui": "#4e4e4e",  "cterm": "239"}
    let nermal_gray             = {"gui": "#6c6c6c",  "cterm": "242"}
    let ash_white               = {"gui": "#bcbcbc",  "cterm": "250"}
    let white                   = {"gui": "#ffffff",  "cterm": "255"}
    let black                   = {"gui": "#000000",  "cterm": "0"}

    " Font styles
    let none            = {"gui": "NONE", "cterm": "NONE"}
    let bold            = {"gui": "bold", "cterm": "bold"}
    let underline       = {"gui": "underline", "cterm": "underline"}
    let italic          = {"gui": "italic", "cterm": "italic"}

    " Highlight
    let highlight_group = {}
    let highlight_group.Changed                    = [portal_green, none, underline, none]
    let highlight_group.ColorColumn                = [lasagana_orange, none, bold, none]
    let highlight_group.Comment                    = [shadow_black, none, italic, none]
    let highlight_group.Constant                   = [lasagana_orange, none, none, none]
    let highlight_group.CurSearch                  = [portal_green, cosmic_blue, bold, none]
    let highlight_group.Cursor                     = [shadow_black, lasagana_orange, bold, none]
    let highlight_group.CursorLine                 = [none, none, none, none]
    let highlight_group.CursorLineNr               = [lasagana_orange, none, bold, none]
    let highlight_group.Delimiter                  = [ash_white, none, none, none]
    let highlight_group.DiagnosticError            = [rot_red, none, none, none]
    let highlight_group.DiagnosticInfo             = [nermal_gray, none, none, none]
    let highlight_group.DiagnosticOk               = [nausea_green, none, none, none]
    let highlight_group.DiagnosticWarn             = [odie_yellow, none, none, none]
    let highlight_group.DiffAdd                    = [portal_green, none, bold, none]
    let highlight_group.DiffChange                 = highlight_group.Changed
    let highlight_group.DiffDelete                 = [blood_red, none, none, none]
    let highlight_group.Added                      = highlight_group.DiffAdd
    let highlight_group.Removed                    = [blood_red, none, none, none]
    let highlight_group.DiffText                   = [ash_white, creepy_purple, none, none]
    let highlight_group.Directory                  = [nausea_green, none, bold, none]
    let highlight_group.Error                      = [ash_white, blood_red, bold, none]
    let highlight_group.ErrorMsg                   = [blood_red, void_black, bold, none]
    let highlight_group.Folded                     = [creepy_purple, none, bold, none]
    let highlight_group.Function                   = [ash_white, none, bold, none]
    let highlight_group.Identifier                 = [lasagana_orange, none, bold, none]
    let highlight_group.Statement                  = [odie_yellow, none, none, none]
    let highlight_group.lCursor                    = [lasagana_orange, none, bold, none]
    let highlight_group.LineNr                     = [obsidian_black, none, none, none]
    let highlight_group.MatchParen                 = [portal_green, cosmic_blue, bold, none]
    let highlight_group.Normal                     = [ash_white, none, none, none]
    let highlight_group.NormalFloat                = [lasagana_orange, none, none, none]
    let highlight_group.NotificationInfo           = [lasagana_orange, shadow_black, none, none]
    let highlight_group.Number                     = [creepy_purple, none, none, none]
    let highlight_group.Operator                   = [creepy_purple, none, none, none]
    let highlight_group.Pmenu                      = [shadow_black, void_black, none, none]
    let highlight_group.PmenuSel                   = [white, blood_red, bold, none]
    let highlight_group.PreProc                    = [lasagana_orange, none, bold, none]
    let highlight_group.Search                     = [portal_green, none, bold, none]
    let highlight_group.Special                    = [lasagana_orange, none, none, none]
    let highlight_group.SpecialKey                 = [creepy_purple, lasagana_orange, bold, none]
    let highlight_group.SpellBad                   = [blood_red, none, underline, none]
    let highlight_group.SpellLocal                 = [lasagana_orange, none, underline, none]
    let highlight_group.SpellRare                  = [cosmic_blue, none, underline, none]
    let highlight_group.Statement                  = [lasagana_orange, none, bold, none]
    let highlight_group.StatusLine                 = [black, lasagana_orange, bold, none]
    let highlight_group.String                     = [creepy_purple, none, none, none]
    let highlight_group.TelescopeBorder            = [violent_violet, none, bold, none]
    let highlight_group.TabLine                    = [shadow_black, void_black, bold, none]
    let highlight_group.TabLineFill                = [none, void_black, none, none]
    let highlight_group.TabLineSel                 = [shadow_black, lasagana_orange, bold, none]
    let highlight_group.Title                      = [lasagana_orange, none, bold, none]
    let highlight_group.Todo                       = [blood_red, none, bold, none]
    let highlight_group.Type                       = [lasagana_orange, none, bold, none]
    let highlight_group.Underlined                 = [violent_violet, none, underline, none]
    let highlight_group.Visual                     = [lasagana_orange, cosmic_blue, bold, none]
    let highlight_group.WarningMsg                 = [portal_green, none, italic, none]
    let highlight_group["@string.special.url"]     = [creepy_purple, none, none, none]

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

    " Links
    hi! link Changed DiffChange
endfunction

call s:set()
