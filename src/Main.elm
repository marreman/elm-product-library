module Main exposing (..)

import Html
import Types exposing (..)
import Update
import View


main =
    Html.beginnerProgram
        { model = init
        , update = Update.update
        , view = View.view
        }


init : Model
init =
    { products = []
    , newProductText = ""
    }
