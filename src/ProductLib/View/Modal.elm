module ProductLib.View.Modal exposing (view, style)

import Css exposing (..)
import Css.Elements as Element
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import ProductLib.Style.Helpers exposing (css)
import ProductLib.Types exposing (..)


type CssClasses
    = Fullscreen
    | Container
    | Overlay
    | Modal
    | TextField
    | TextFieldLabel
    | TextFieldInput


( style, local ) =
    css "ProductLib.View.Modal" <|
        [ class Fullscreen
            [ position absolute
            , top zero
            , left zero
            , width (pct 100)
            , height (pct 100)
            ]
        , class Container
            [ displayFlex
            , justifyContent center
            , alignItems center
            ]
        , class Overlay
            [ backgroundColor (rgba 0 0 0 0.5) ]
        , class Modal
            [ backgroundColor (rgb 255 255 255)
            , width (px 500)
            , padding3 (px 10) (px 30) (px 40)
            , position relative
            ]
        , class TextField
            [ display block
            , marginBottom (px 20)
            , children
                [ Element.input
                    [ width (pct 100) ]
                ]
            ]
        , class TextFieldLabel
            [ display block
            , marginBottom (px 10)
            ]
        ]


view : Html Msg
view =
    div [ local.class [ Fullscreen, Container ] ]
        [ div [ local.class [ Fullscreen, Overlay ], onClick CloseModal ] []
        , div [ local.class [ Modal ] ]
            [ h2 [] [ Html.text "New product" ]
            , div []
                [ viewInput "name" "Name"
                , viewInput "price" "Price"
                , button [ onClick CreateNewProduct ] [ Html.text "Create" ]
                ]
            ]
        ]


viewInput : String -> String -> Html Msg
viewInput prop name =
    label [ local.class [ TextField ] ]
        [ strong [ local.class [ TextFieldLabel ] ] [ Html.text name ]
        , input [ onInput <| UpdateNewProduct prop ] []
        ]
