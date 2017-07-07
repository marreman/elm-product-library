module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Product exposing (..)
import Price
import Compound exposing (Compound(..))
import Modal exposing (Modal)


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
    { products : List Product
    , modal : Modal
    }


model : Model
model =
    { products =
        [ Product.single
            (ProductInfo "Orange Juice" 10.0)
        , Product.group 1
            "Pies"
            (ProductInfo "Blueberry" 9.0)
            (ProductInfo "Lemon" 11.0)
            []
        , Product.group 2
            "Animals"
            (ProductInfo "Cat" 15.2)
            (ProductInfo "Dog" 33.1)
            []
        ]
    , modal = Modal.init
    }


type Msg
    = ToggleGroup Int
    | ModalMsg Modal.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ModalMsg modalMsg ->
            { model | modal = Modal.update modalMsg model.modal }

        ToggleGroup id ->
            let
                updateProduct productType =
                    case productType of
                        Single _ ->
                            productType

                        Group info products ->
                            if info.id == id then
                                Product.toggleGroup productType
                            else
                                productType
            in
                { model | products = List.map updateProduct model.products }


view : Model -> Html Msg
view model =
    main_ [ class "main" ]
        [ header []
            [ h1 [] [ text "Products" ]
            , button [ class "button", onClick <| ModalMsg Modal.Open ] [ text "Add product" ]
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
        , if model.modal.isOpen then
            Html.map ModalMsg <| Modal.view model.modal
          else
            text ""
        ]


viewProduct : Product -> List (Html Msg)
viewProduct productType =
    case productType of
        Single product ->
            [ viewSingleProduct product ]

        Group info products ->
            viewProductGroup info products


viewSingleProduct : ProductInfo -> Html Msg
viewSingleProduct product =
    tr [ class "row" ]
        [ td [] [ text product.name ]
        , td [] [ text "" ]
        , td [] [ text <| toCurrency product.price ]
        ]


viewProductGroup : GroupInfo -> Compound ProductInfo -> List (Html Msg)
viewProductGroup info products =
    List.concat
        [ [ tr [ class "row" ]
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
        , if info.isOpen then
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
          else
            []
        ]
