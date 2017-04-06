module View.Modal exposing (view, css)

import Css exposing (..)
import Css.Common exposing (cls)
import Html exposing (..)
import Types exposing (..)


type CssClasses
    = Modal


css =
    [ class Modal
        [ color (rgb 255 0 0) ]
    ]


view : Html Msg
view =
    div [ cls Modal ]
        []
