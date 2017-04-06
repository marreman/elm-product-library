module ProductLib.Update exposing (update)

import ProductLib.Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewProduct ->
            { model | isModalOpen = True }

        CloseModal ->
            { model | isModalOpen = False }

        NoOp ->
            model
