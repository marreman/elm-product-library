module Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, h1, button)
import Css.Namespace exposing (namespace)


type CssClasses
    = Container
    | Library
    | Header
    | Body


ns =
    "iz_"


colors =
    { lightGrey = hex "eceeef"
    , white = hex "ffffff"
    }


gradient : Color -> Color -> Mixin
gradient from to =
    let
        value =
            from.value ++ ", " ++ to.value
    in
        property "background-image" <| "linear-gradient(" ++ value ++ ")"


css =
    (stylesheet << namespace ns)
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
        , class Container
            [ maxWidth (px 1340)
            , margin auto
            ]
        , class Library
            [ backgroundColor colors.white
            ]
        , class Header
            [ padding2 (px 20) (px 30)
            , borderBottom3 (px 1) solid colors.lightGrey
            , displayFlex
            , alignItems center
            , children
                [ h1
                    [ fontSize (px 22)
                    , fontWeight bold
                    , margin zero
                    ]
                , button
                    [ marginLeft auto ]
                ]
            ]
        , class Body
            [ padding2 (px 20) (px 30)
            ]
        ]
