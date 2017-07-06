module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Product exposing (..)


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
        , Product.group
            "Pies"
            (Product "Blueberry" 9.0)
            (Product "Blueberry" 11.0)
            []
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


viewProduct : ProductType -> Html Msg
viewProduct productType =
    case productType of
        Single product ->
            tr []
                [ td [] [ text product.name ]
                , td [] [ text "" ]
                , td [] [ text <| toString product.price ]
                ]

        Group name products ->
            tr []
                [ td [] [ text name ]
                , td [] [ text <| toString <| Product.length products ]
                , td [] [ text <| toString <| Product.priceRange products ]
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
