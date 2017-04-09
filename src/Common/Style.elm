module Common.Style exposing (..)

import Css exposing (..)
import Css.Elements as Element exposing (..)
import Css.Namespace
import Html.CssHelpers exposing (Namespace)


-- HELPER FOR CREATING NAMESPACED STYLES


css ns snippets =
    let
        helpers =
            Html.CssHelpers.withNamespace (ns ++ "__")
    in
        ( Css.Namespace.namespace (ns ++ "__") snippets
        , { class = \cls -> helpers.class [ cls ]
          , classes = helpers.class
          , classList = helpers.classList
          , id = helpers.id
          }
        )


colors =
    { lightGrey = hex "eceeef"
    , white = hex "ffffff"
    , blue = rgb 27 160 227
    , darkBlue = rgb 3 131 195
    , darkerBlue = hex "0072ac"
    }


gradient : Color -> Color -> Mixin
gradient from to =
    let
        value =
            from.value ++ ", " ++ to.value
    in
        property "background-image" <| "linear-gradient(" ++ value ++ ")"



-- GLOBAL STYLES


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
