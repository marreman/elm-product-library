module ProductLib.State exposing (init, update)

import ProductLib.Types exposing (..)


init : Model
init =
    { products =
        [ Product 1 "Chocolate cupcake" 7.9
        , Product 2 "Strawberry cupcake" 13.9
        , Product 3 "Raspberry cupcake" 5.5
        , Product 4 "Healty cupcake" 12.5
        ]
    , formId = 0
    , formName = ""
    , formPrice = ""
    , isModalOpen = False
    , editType = NewProduct
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        New ->
            { model
                | isModalOpen = True
                , editType = NewProduct
                , formId = 0
                , formName = ""
                , formPrice = ""
            }

        Create ->
            { model
                | isModalOpen = False
                , products = createProductFromForm model :: model.products
            }

        Cancel ->
            { model | isModalOpen = False }

        Edit product ->
            { model
                | isModalOpen = True
                , editType = ExistingProduct
                , formId = product.id
                , formName = product.name
                , formPrice = toString product.price
            }

        Save ->
            { model
                | products =
                    List.map
                        (\p ->
                            if p.id == model.formId then
                                createProductFromForm model
                            else
                                p
                        )
                        model.products
                , isModalOpen = False
            }

        UpdateName name ->
            { model | formName = name }

        UpdatePrice price ->
            { model | formPrice = price }


createProductFromForm : Model -> Product
createProductFromForm model =
    { id =
        model.products
            |> List.map .id
            |> List.sum
    , name = model.formName
    , price =
        model.formPrice
            |> String.toFloat
            |> Result.withDefault 0
    }
