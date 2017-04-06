module Main exposing (..)

import Html
import ProductLibrary


main =
    Html.beginnerProgram
        { model = ProductLibrary.model
        , update = ProductLibrary.update
        , view = ProductLibrary.view
        }
