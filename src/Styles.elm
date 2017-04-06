module Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (body)
import Css.Namespace exposing (namespace)


type CssClasses
    = Container


ns =
    "iz_"


css =
    (stylesheet << namespace ns)
        [ body
            [ backgroundColor (hex "eceeef")
            , margin zero
            ]
        , class Container
            [ maxWidth (px 1340)
            , margin auto
            ]
        ]
