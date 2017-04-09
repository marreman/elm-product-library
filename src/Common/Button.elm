module Common.Button
    exposing
        ( withText
        , withIcon
        , withIconAndText
        , Icon(..)
        , style
        )

import Css exposing (..)
import Css.Elements as Element
import Html exposing (Html)
import Html.Attributes
import Html.Events
import Common.Style exposing (css, gradient, colors)


type Icon
    = Plus
    | Pen


withText : String -> msg -> Html msg
withText text msg =
    Html.button
        [ local.classes [ Button, WithText ], Html.Events.onClick msg ]
        [ Html.text text ]


withIcon : Icon -> msg -> Html msg
withIcon icon msg =
    Html.button
        [ local.classes [ Button, WithIcon ], Html.Events.onClick msg ]
        [ Html.img [ Html.Attributes.src <| srcFromIcon icon ] [] ]


withIconAndText : Icon -> String -> msg -> Html msg
withIconAndText icon text msg =
    Html.button
        [ local.classes [ Button, WithIconAndText ], Html.Events.onClick msg ]
        [ Html.img [ Html.Attributes.src <| srcFromIcon icon ] []
        , Html.text text
        ]


type Class
    = Button
    | WithText
    | WithIcon
    | WithIconAndText


( style, local ) =
    css "Button" <|
        [ class Button
            [ gradient colors.blue colors.darkBlue
            , fontFamilies [ "Zent" ]
            , fontWeight bold
            , fontSize (px 14)
            , border3 (px 1) solid colors.darkerBlue
            , boxShadow4 (px 0) (px 1) (px 3) (rgba 0 0 0 0.35)
            , color colors.white
            , displayFlex
            , justifyContent center
            , alignItems center
            , outline none
            , cursor pointer
            ]
        , class WithText
            [ padding2 (px 12) (px 20)
            , borderRadius (px 3)
            ]
        , class WithIcon
            [ borderRadius (pct 100)
            , width (px 45)
            , height (px 45)
            ]
        , class WithIconAndText
            [ padding2 (px 12) (px 20)
            , borderRadius (px 3)
            , children
                [ Element.img
                    [ marginRight (px 5)
                    , marginTop (px -1)
                    ]
                ]
            ]
        ]


srcFromIcon : Icon -> String
srcFromIcon icon =
    icon
        |> toString
        |> String.toLower
        |> \i -> i ++ ".svg"
