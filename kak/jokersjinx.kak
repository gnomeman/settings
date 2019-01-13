# colorscheme: jokers-jinx

evaluate-commands %sh{
    lime='rgb:58db00'
    lemon_lime='rgb:bcff00'
    swamp_green='rgb:008f00'
    faint_purple='rgb:5d5d98'
    bright_magenta='rgb:db00db'
    dark_violet='rgb:842caf'
    light_gray='rgb:d9d9d9'
    light_gray_2='rgb:bdbdbd'
    light_gray_3='rgb:c9c9c9'
    light_gray_4='rgb:adadad'
    light_gray_5='rgb:919191'
    gray='rgb:737373'
    gray_2='rgb:575757'
    almost_black='rgb:1c1c1c'
    almost_black_2='rgb:0f0f0f'
    almost_black_3='rgb:2b2b2b'
    black='rgb:000000'

    echo "
    # code
    face global value              ${lime},default
    face global type               ${lemon_lime},default
    face global identifier         ${faint_purple},default
    face global string             ${bright_magenta},default
    face global error              default,${light_gray}
    face global keyword            ${lime},default+b
    face global operator           ${light_gray_2},default
    face global attribute          ${light_gray},default
    face global comment            ${bright_magenta},default
    face global meta               ${lemon_lime},default

    # text
    face global title              ${swamp_green},default+b
    face global header             ${light_gray},default
    face global bold               ${light_gray},default+b
    face global italic             ${light_gray_3},default+i
    face global mono               ${swamp_green},${almost_black}
    face global block              ${light_gray_4},${almost_black}
    face global link               ${light_gray},default
    face global bullet             ${light_gray},default
    face global list               ${light_gray_2},default

    # kakoune UI
    face global Default            default,default
    # face global PrimarySelection   ${black},${light_gray_4}
    face global PrimarySelection   ${black},${bright_magenta}
    face global SecondarySelection ${almost_black_2},${light_gray_5}
    # face global PrimaryCursor      ${black},${light_gray}+b
    face global PrimaryCursor      ${black},${lemon_lime}+b
    # face global SecondaryCursor    ${almost_black_2},${light_gray_2}+b
    face global SecondaryCursor    ${almost_black_2},${swamp_green}+b
    face global MatchingChar       default,${almost_black_3}
    face global Search             default,${almost_black_3}
    face global Whitespace         default,${almost_black_3}
    face global BufferPadding      ${almost_black_3},default
    face global LineNumbers        ${dark_violet},${black}+b
    face global LineNumberCursor   ${gray_2},default
    face global MenuForeground     ${lime},${dark_violet}+b
    face global MenuBackground     ${lime},${almost_black}
    face global MenuInfo           default,${gray_2}
    face global Information        ${lime},${gray_2}
    face global Error              ${almost_black_2},${light_gray_2}
    face global StatusLine         ${lime},${almost_black}
    face global StatusLineMode     ${lime},${almost_black_2}
    face global StatusLineInfo     ${lime},${almost_black_3}
    face global StatusLineValue    ${lime},${gray_2}
    face global StatusCursor       default,${dark_violet}
    face global Prompt             ${lime},${almost_black}
    "
}
