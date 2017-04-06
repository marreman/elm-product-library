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
    { products =
        [ Product "1" "Chocolate cupcake" 7.9
        , Product "2" "Strawberry cupcake" 13.9
        , Product "3" "Raspberry cupcake" 5.5
        , Product "4" "Healty cupcake" 12.5
        ]
    , newProductText = ""
    , isModalOpen = False
    }
