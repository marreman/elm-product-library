module View exposing (view)

import Types exposing (..)
import Html exposing (..)
import ProductLib.View


view : Model -> Html Msg
view model =
    Html.map ProductLibMsg <| ProductLib.View.view model.productLibrary
