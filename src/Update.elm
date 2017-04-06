module Update exposing (update)

import Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewProductText text ->
            { model | newProductText = text }

        Create ->
            { model
                | products = (Product "1" model.newProductText) :: model.products
                , newProductText = ""
            }

        NoOp ->
            model
