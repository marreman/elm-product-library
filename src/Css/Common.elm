module Css.Common exposing (..)

import Css exposing (..)
import Html.CssHelpers


namespace =
    "iz_"


helpers =
    Html.CssHelpers.withNamespace namespace


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
