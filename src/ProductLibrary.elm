module ProductLibrary exposing (..)

import Html exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { products : List Product
    , newProductText : String
    }


type alias Product =
    { id : String
    , name : String
    }


model : Model
model =
    { products = []
    , newProductText = ""
    }



-- UPDATE


type Msg
    = NoOp
    | NewProductText String
    | Create


update : Msg -> Model -> Model
update msg model =
    case msg of
        NewProductText text ->
            { model | newProductText = text }

        Create ->
            { model
                | products = (Product "1" model.newProductText) :: model.products
                , newProductText = ""
            }

        NoOp ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ onInput NewProductText ] []
        , button [ onClick Create ] [ text "Create" ]
        , table []
            [ thead []
                [ th [] [ text "ID" ]
                , th [] [ text "Name" ]
                ]
            , tbody [] <| List.map viewProduct model.products
            ]
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr []
        [ td [] [ text product.id ]
        , td [] [ text product.name ]
        ]
