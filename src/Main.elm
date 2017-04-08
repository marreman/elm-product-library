module Main exposing (..)

import Dict
import Html
import ProductLib.Main


main : Program Never ProductLib.Main.Model ProductLib.Main.Msg
main =
    Html.beginnerProgram
        { model = ProductLib.Main.init
        , update = ProductLib.Main.update
        , view = ProductLib.Main.view
        }
