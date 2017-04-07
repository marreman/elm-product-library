module ProductLib.Style.Common exposing (..)

import Css exposing (..)


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
