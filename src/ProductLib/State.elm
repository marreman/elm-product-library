module ProductLib.State exposing (init, update)

import ProductLib.Types exposing (..)


init : Model
init =
    { products =
        [ Product "Chocolate cupcake" 7.9
        , Product "Strawberry cupcake" 13.9
        , Product "Raspberry cupcake" 5.5
        , Product "Healty cupcake" 12.5
        ]
    , formName = ""
    , formPrice = ""
    , isModalOpen = False
    }


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
