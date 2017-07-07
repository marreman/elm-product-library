module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Product exposing (..)
import Price


toCurrency : Float -> String
toCurrency =
    Price.toCurrency Price.EUR


rangeToCurrency : ( Float, Float ) -> String
rangeToCurrency =
    Price.rangeToCurrency Price.EUR


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { products : List ProductType
    , modalIsOpen : Bool
    , productName : String
    , productPrice : String
    }


model : Model
model =
    { products =
        [ Product.single
            (Product "Orange Juice" 10.0)
        , Product.group 1
            "Pies"
            (Product "Blueberry" 9.0)
            (Product "Lemon" 11.0)
            []
        , Product.group 2
            "Animals"
            (Product "Cat" 15.2)
            (Product "Dog" 33.1)
            []
        ]
    , modalIsOpen = False
    , productName = ""
    , productPrice = ""
    }


type Msg
    = OpenProductModal
    | CloseProductModal
    | ToggleGroup Int
    | UpdateProductName String
    | UpdateProductPrice String


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenProductModal ->
            { model | modalIsOpen = True }

        CloseProductModal ->
            { model | modalIsOpen = False }

        ToggleGroup id ->
            { model
                | products =
                    List.map
                        (\productType ->
                            case productType of
                                Single _ ->
                                    productType

                                Group info products ->
                                    if info.id == id then
                                        Product.toggleGroup productType
                                    else
                                        productType
                        )
                        model.products
            }

        UpdateProductName newName ->
            { model | productName = newName }

        UpdateProductPrice newPrice ->
            { model | productPrice = newPrice }


view : Model -> Html Msg
view model =
    main_ [ class "main" ]
        [ header []
            [ h1 [] [ text "Products" ]
            , button [ class "button", onClick OpenProductModal ] [ text "Add product" ]
            ]
        , table []
            [ thead []
                [ tr [ class "row" ]
                    [ th [] [ text "Name" ]
                    , th [] [ text "Variants" ]
                    , th [] [ text "Price" ]
                    ]
                ]
            , tbody [] <| List.concatMap viewProduct model.products
            ]
        , if model.modalIsOpen then
            viewModal
          else
            text ""
        ]


viewProduct : ProductType -> List (Html Msg)
viewProduct productType =
    case productType of
        Single product ->
            [ tr [ class "row" ]
                [ td [] [ text product.name ]
                , td [] [ text "" ]
                , td [] [ text <| toCurrency product.price ]
                ]
            ]

        Group info products ->
            let
                viewGroup =
                    [ tr [ class "row" ]
                        [ td [] [ text info.name ]
                        , td []
                            [ text <| toString <| Product.length products
                            , button [ onClick <| ToggleGroup info.id ]
                                [ text <|
                                    if info.isOpen then
                                        "⬆"
                                    else
                                        "⬇"
                                ]
                            ]
                        , td [] [ text <| rangeToCurrency <| Product.priceRange products ]
                        ]
                    ]

                viewProducts =
                    List.map
                        (\product ->
                            tr []
                                [ td [] []
                                , td [] [ text product.name ]
                                , td [] [ text <| toCurrency product.price ]
                                ]
                        )
                    <|
                        Product.toList products
            in
                viewGroup
                    ++ if info.isOpen then
                        viewProducts
                       else
                        []


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
                [ Html.form []
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
