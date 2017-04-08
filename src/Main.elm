module Main exposing (..)

import Dict
import Html exposing (Html)
import ProductLib.Main as ProductLib


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = init
        , update = update
        , view = view
        }



-- MODEL


type alias Model =
    { productLibrary : ProductLib.Model
    }



-- INIT


init : Model
init =
    { productLibrary = ProductLib.init
    }



-- UPDATE


type Msg
    = ProductLibMsg ProductLib.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ProductLibMsg productLibMsg ->
            { model | productLibrary = ProductLib.update productLibMsg model.productLibrary }



-- VIEW


view : Model -> Html Msg
view model =
    Html.map ProductLibMsg <| ProductLib.view model.productLibrary
