module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { products : List Product
    , modalIsOpen : Bool
    , productName : String
    , productPrice : String
    }


type alias Product =
    { name : String
    , variants : List Variant
    }


type alias Variant =
    { name : String
    , price : Float
    }


model : Model
model =
    { products =
        [ Product "Pie"
            [ Variant "Blueberry" 10.0
            , Variant "Lemon" 20.0
            ]
        , Product "Juice"
            [ Variant "" 10.0
            ]
        ]
    , modalIsOpen = False
    , productName = ""
    , productPrice = ""
    }


type Msg
    = OpenProductModal
    | CloseProductModal
    | UpdateProductName String
    | UpdateProductPrice String
    | CreateNewProduct


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenProductModal ->
            { model | modalIsOpen = True }

        CloseProductModal ->
            { model | modalIsOpen = False }

        UpdateProductName newName ->
            { model | productName = newName }

        UpdateProductPrice newPrice ->
            { model | productPrice = newPrice }

        CreateNewProduct ->
            let
                newProduct =
                    { name = model.productName
                    , price =
                        model.productPrice
                            |> String.toFloat
                            |> Result.withDefault 0
                    }
            in
                { model
                    | products = model.products
                    , modalIsOpen = False
                }


view : Model -> Html Msg
view model =
    main_ [ class "main" ]
        [ header []
            [ h1 [] [ text "Products" ]
            , button [ class "button", onClick OpenProductModal ] [ text "Add product" ]
            ]
        , table []
            [ thead []
                [ tr []
                    [ th [] [ text "Name" ]
                    , th [] [ text "Variants" ]
                    , th [] [ text "Price" ]
                    ]
                ]
            , tbody [] <| List.map viewProduct model.products
            ]
        , if model.modalIsOpen then
            viewModal
          else
            text ""
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    let
        maxPrice =
            product.variants
                |> List.map .price
                |> List.maximum
                |> Maybe.map toString
                |> Maybe.withDefault ""

        minPrice =
            product.variants
                |> List.map .price
                |> List.minimum
                |> Maybe.map toString
                |> Maybe.withDefault ""

        numberOfVariants =
            List.length product.variants

        price =
            if numberOfVariants > 1 then
                minPrice ++ " - " ++ maxPrice
            else
                maxPrice

        variants =
            if numberOfVariants > 1 then
                toString numberOfVariants
            else
                ""
    in
        tr []
            [ td [] [ text product.name ]
            , td [] [ text variants ]
            , td [] [ text price ]
            ]


viewModal : Html Msg
viewModal =
    div []
        [ div [ class "overlay", onClick CloseProductModal ] []
        , div [ class "modal" ]
            [ header []
                [ h2 [] [ text "New Product" ]
                , button [ class "modal-close", onClick CloseProductModal ] [ text "×" ]
                ]
            , main_ [ class "modal-body" ]
                [ Html.form [ onSubmit CreateNewProduct ]
                    [ label []
                        [ text "Name"
                        , input
                            [ type_ "text"
                            , required True
                            , onInput UpdateProductName
                            ]
                            []
                        ]
                    , label []
                        [ text "Price"
                        , input
                            [ type_ "number"
                            , required True
                            , Html.Attributes.min "0"
                            , onInput UpdateProductPrice
                            ]
                            []
                        ]
                    , footer [ class "modal-footer" ]
                        [ button [ class "button", type_ "submit" ] [ text "Create" ] ]
                    ]
                ]
            ]
        ]
