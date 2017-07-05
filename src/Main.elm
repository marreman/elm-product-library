module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { products : List Product
    , productModalIsOpen : Bool
    }


type alias Product =
    { name : String
    , price : Float
    }


model : Model
model =
    { products =
        [ Product "Pie" 30.0
        , Product "Sliced Melon" 10.5
        ]
    , productModalIsOpen = False
    }


type Msg
    = OpenProductModal
    | CloseProductModal


update : Msg -> Model -> Model
update msg model =
    case msg of
        OpenProductModal ->
            { model | productModalIsOpen = True }

        CloseProductModal ->
            { model | productModalIsOpen = False }


view : Model -> Html Msg
view model =
    main_ []
        [ header []
            [ h1 [] [ text "Products" ]
            , button [ onClick OpenProductModal ] [ text "Add product" ]
            ]
        , table []
            [ thead []
                [ tr []
                    [ th [] [ text "Name" ]
                    , th [] [ text "Price" ]
                    ]
                ]
            , tbody [] <| List.map viewProduct model.products
            ]
        , if model.productModalIsOpen then
            viewModal
          else
            text ""
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr []
        [ td [] [ text product.name ]
        , td [] [ text <| toString product.price ]
        ]


viewModal : Html Msg
viewModal =
    div []
        [ div [ class "overlay", onClick CloseProductModal ] []
        , div [ class "modal" ] [ h2 [] [ text "New Product" ] ]
        ]
