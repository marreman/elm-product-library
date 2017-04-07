module ProductLib.Update exposing (update)

import Dict
import ProductLib.Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewProduct ->
            { model | isModalOpen = True }

        CloseModal ->
            { model | isModalOpen = False }

        UpdateNewProduct prop value ->
            { model | newProduct = Dict.insert prop value model.newProduct }

        CreateNewProduct ->
            let
                product =
                    { id = "3"
                    , name =
                        Dict.get "name" model.newProduct
                            |> Maybe.withDefault "123"
                    , price =
                        Dict.get "price" model.newProduct
                            |> Maybe.withDefault "0"
                            |> String.toFloat
                            |> Result.withDefault 0
                    }
            in
                { model
                    | products = product :: model.products
                    , isModalOpen = False
                }

        NoOp ->
            model
