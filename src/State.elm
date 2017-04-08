module State exposing (..)

import Types exposing (..)
import ProductLib.State


init : Model
init =
    { productLibrary = ProductLib.State.init
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ProductLibMsg productLibMsg ->
            { model
                | productLibrary =
                    ProductLib.State.update productLibMsg model.productLibrary
            }
