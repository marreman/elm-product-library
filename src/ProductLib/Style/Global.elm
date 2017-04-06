module ProductLib.Style.Global exposing (..)

import Css exposing (..)
import Css.Elements as Element exposing (..)
import ProductLib.Style.Common exposing (colors, gradient)


style : List Snippet
style =
    [ body
        [ backgroundColor colors.lightGrey
        , margin zero
        , fontFamilies [ "Zent" ]
        ]
    , button
        [ gradient (rgb 27 160 227) (rgb 3 131 195)
        , fontFamilies [ "Zent" ]
        , fontWeight bold
        , fontSize (px 14)
        , padding2 (px 12) (px 20)
        , border3 (px 1) solid (hex "0072ac")
        , borderRadius (px 3)
        , boxShadow4 (px 0) (px 1) (px 3) (rgba 0 0 0 0.35)
        , color colors.white
        ]
    , Element.table
        [ width (pct 100) ]
    , th
        [ textAlign left
        , fontSize (px 13)
        , textTransform uppercase
        , opacity (num 0.4)
        , padding2 (px 10) (px 20)
        ]
    ]
