module ProductLib.View.Modal exposing (view, style)

import Css exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import ProductLib.Style.Helpers exposing (css)
import ProductLib.Types exposing (..)


type CssClasses
    = Container
    | Overlay
    | Modal
    | TextField
    | TextFieldLabel
    | TextFieldInput


( style, local ) =
    css "modal" <|
        [ class Container overlay
        , class Overlay <| overlay ++ [ backgroundColor (rgba 0 0 0 0.5) ]
        , class Modal
            [ backgroundColor (rgb 255 255 255)
            , width (px 500)
            , padding3 (px 10) (px 30) (px 40)
            , position relative
            ]
        , class TextField
            [ display block
            , marginBottom (px 20)
            ]
        , class TextFieldLabel
            [ display block
            ]
        ]


overlay =
    [ position absolute
    , displayFlex
    , justifyContent center
    , alignItems center
    , top zero
    , left zero
    , width (pct 100)
    , height (pct 100)
    ]


view : Html Msg
view =
    div [ local.class [ Container ] ]
        [ div [ local.class [ Overlay ], onClick CloseModal ] []
        , div [ local.class [ Modal ] ]
            [ h2 [] [ Html.text "New product" ]
            , div []
                [ viewInput "Name"
                , viewInput "Price"
                ]
            ]
        ]


viewInput : String -> Html Msg
viewInput name =
    label [ local.class [ TextField ] ]
        [ strong [ local.class [ TextFieldLabel ] ] [ Html.text name ]
        , input [] []
        ]
