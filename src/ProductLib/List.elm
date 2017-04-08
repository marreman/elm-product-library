module ProductLib.List
    exposing
        ( Model
        , init
        , view
        , style
        )

import Css exposing (..)
import Css.Elements as Elements
import Html exposing (..)
import Html.Attributes as Attrs
import Html.Events exposing (..)
import ProductLib.Style.Common exposing (..)
import ProductLib.Style.Helpers exposing (css)


-- MODEL


type alias Model =
    List Product


type alias Product =
    { id : String
    , name : String
    , price : Float
    }



-- INIT


init : Model
init =
    [ Product "1" "Chocolate cupcake" 7.9
    , Product "2" "Strawberry cupcake" 13.9
    , Product "3" "Raspberry cupcake" 5.5
    , Product "4" "Healty cupcake" 12.5
    ]



-- VIEW


view : List Product -> Html msg
view products =
    Html.table []
        [ thead []
            [ th [] [ Html.text "Image" ]
            , th [] [ Html.text "Name" ]
            , th [] [ Html.text "Price" ]
            , th [] [ Html.text "Edit" ]
            ]
        , tbody [] <| List.map viewProduct products
        ]


viewProduct : Product -> Html msg
viewProduct product =
    tr [ local.class [ ProductRow ] ]
        [ td [] [ viewProductImage ]
        , td [] [ Html.text product.name ]
        , td [] [ Html.text <| toString product.price ]
        , td [] [ button [] [ Html.text "e" ] ]
        ]


viewProductImage : Html msg
viewProductImage =
    img
        [ Attrs.src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , local.class [ ProductRowImage ]
        ]
        []



-- STYLE


type CssClasses
    = ProductRow
    | ProductRowImage


( style, local ) =
    css "ProductLib_List" <|
        [ class ProductRow
            [ fontWeight bold
            , children
                [ Elements.td
                    [ borderTop3 (px 1) solid colors.lightGrey
                    , padding2 (px 10) (px 20)
                    ]
                ]
            ]
        , class ProductRowImage
            [ width (px 60)
            , margin2 (px 10) zero
            ]
        ]
