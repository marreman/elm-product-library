module Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (body)
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


css =
    (stylesheet << namespace ns)
        [ body
            [ backgroundColor colors.lightGrey
            , margin zero
            , fontFamilies [ "Zent" ]
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
            , fontSize (px 22)
            , fontWeight bold
            ]
        , class Body
            [ padding2 (px 20) (px 30)
            ]
        ]
