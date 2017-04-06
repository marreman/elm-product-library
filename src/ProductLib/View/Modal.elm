module ProductLib.View.Modal exposing (view, style)

import Css exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import ProductLib.Style.Common exposing (cls)
import ProductLib.Types exposing (..)


type CssClasses
    = Overlay
    | Modal


style : List Snippet
style =
    [ class Overlay
        [ position absolute
        , displayFlex
        , justifyContent center
        , alignItems center
        , top zero
        , left zero
        , width (pct 100)
        , height (pct 100)
        , backgroundColor (rgba 0 0 0 0.5)
        ]
    , class Modal
        [ backgroundColor (rgb 255 255 255) ]
    ]


view : Html Msg
view =
    div [ cls Overlay, onClick CloseModal ]
        [ div [ cls Modal ] [ Html.text "test" ] ]
