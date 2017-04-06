module ProductLib.Style.Common exposing (..)

import Css exposing (..)


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
