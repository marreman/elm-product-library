module ProductLib.Style.Global exposing (..)

import Css exposing (..)
import Css.Elements as Element exposing (..)
import ProductLib.Style.Common exposing (colors, gradient)


style : List Snippet
style =
    [ everything
        [ boxSizing borderBox ]
    , body
        [ backgroundColor colors.lightGrey
        , margin zero
        , fontFamilies [ "Zent" ]
        ]
    , button
        [ gradient colors.blue colors.darkBlue
        , fontFamilies [ "Zent" ]
        , fontWeight bold
        , fontSize (px 14)
        , padding2 (px 12) (px 20)
        , border3 (px 1) solid colors.darkerBlue
        , borderRadius (px 3)
        , boxShadow4 (px 0) (px 1) (px 3) (rgba 0 0 0 0.35)
        , color colors.white
        ]
    , input
        [ padding2 (px 15) (px 20)
        , fontSize (px 14)
        , fontFamilies [ "Zent" ]
        , borderRadius (px 3)
        , border3 (px 1) solid colors.lightGrey
        , outline none
        , focus
            [ borderColor colors.blue ]
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
