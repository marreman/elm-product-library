module Main exposing (..)

import Html
import ProductLib.Types exposing (..)
import ProductLib.Update
import ProductLib.View


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , update = ProductLib.Update.update
        , view = ProductLib.View.view
        }


init : Model
init =
    { products =
        [ Product "1" "Chocolate cupcake" 7.9
        , Product "2" "Strawberry cupcake" 13.9
        , Product "3" "Raspberry cupcake" 5.5
        , Product "4" "Healty cupcake" 12.5
        ]
    , isModalOpen = True
    }
