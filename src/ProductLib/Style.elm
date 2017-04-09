module ProductLib.Style exposing (..)

import Css exposing (..)
import Css.Elements as Element
import Common.Style exposing (css, colors)


type Class
    = Container
    | Library
    | Header
    | Body
    | Fullscreen
    | ProductsContainer
    | Overlay
    | Modal
    | TextField
    | TextFieldLabel
    | TextFieldInput
    | ProductRow
    | ProductRowImage


( style, local ) =
    css "ProductLib" <|
        [ class Container
            [ maxWidth (px 1340)
            , margin auto
            ]
        , class Library
            [ backgroundColor colors.white
            , borderRadius (px 3)
            , marginTop (px 40)
            ]
        , class Header
            [ padding2 (px 20) (px 30)
            , borderBottom3 (px 1) solid colors.lightGrey
            , displayFlex
            , alignItems center
            , children
                [ Element.h1
                    [ fontSize (px 22)
                    , fontWeight bold
                    , margin zero
                    ]
                , Element.button
                    [ marginLeft auto ]
                ]
            ]
        , class Body
            [ padding2 (px 30) (px 30)
            ]
        , class Fullscreen
            [ position absolute
            , top zero
            , left zero
            , width (pct 100)
            , height (pct 100)
            ]
        , class ProductsContainer
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
        , class ProductRow
            [ fontWeight bold
            , children
                [ Element.td
                    [ borderTop3 (px 1) solid colors.lightGrey
                    , padding2 (px 10) (px 20)
                    , lastChild
                        [ children [ everything [ float right ] ] ]
                    ]
                ]
            ]
        , class ProductRowImage
            [ width (px 60)
            , margin2 (px 10) zero
            ]
        ]
