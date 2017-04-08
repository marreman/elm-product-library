module ProductLib.Update exposing (update)

import ProductLib.Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenModal ->
            { model | isModalOpen = True }

        Create ->
            let
                newProduct =
                    { name = model.formName
                    , price =
                        model.formPrice
                            |> String.toFloat
                            |> Result.withDefault 0
                    }
            in
                { model
                    | isModalOpen = False
                    , products = newProduct :: model.products
                }

        Cancel ->
            { model | isModalOpen = False }

        UpdateName name ->
            { model | formName = name }

        UpdatePrice price ->
            { model | formPrice = price }
