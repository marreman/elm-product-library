module Main exposing (..)

import Html
import Types exposing (..)
import State exposing (init, update)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }
