module Main exposing (main)

import Html exposing (..)


main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    { products : List Product }


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
    }


type Msg
    = Noop


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    main_ []
        [ header []
            [ h1 [] [ text "Products" ]
            , button [] [ text "Add product" ]
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
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr []
        [ td [] [ text product.name ]
        , td [] [ text <| toString product.price ]
        ]
