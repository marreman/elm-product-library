module Css.Common exposing (..)

import Css exposing (..)
import Html.CssHelpers


ns =
    "iz_"


helpers =
    Html.CssHelpers.withNamespace ns


cls class =
    helpers.class [ class ]


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
