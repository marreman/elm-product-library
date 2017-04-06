module View exposing (view)

import Html exposing (..)
import Html.CssHelpers
import Html.Attributes exposing (src)
import Html.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace Styles.ns


view : Model -> Html Msg
view model =
    div [ class [ Container ] ]
        [ div [ class [ Library ] ]
            [ viewHeader
            , viewBody model
            ]
        ]


viewHeader : Html Msg
viewHeader =
    div [ class [ Header ] ]
        [ h1 [] [ text "Product Library" ]
        , button [] [ text "Create product" ]
        ]


viewBody : Model -> Html Msg
viewBody model =
    div [ class [ Body ] ]
        [ table []
            [ thead []
                [ th [] [ text "Image" ]
                , th [] [ text "Name" ]
                , th [] [ text "Price" ]
                , th [] [ text "Edit" ]
                ]
            , tbody [] <| List.map viewProduct model.products
            ]
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr [ class [ ProductRow ] ]
        [ td [] [ viewProductImage ]
        , td [] [ text product.name ]
        , td [] [ text <| toString product.price ]
        , td [] [ button [] [ text "e" ] ]
        ]


viewProductImage : Html Msg
viewProductImage =
    img
        [ src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , class [ ProductRowImage ]
        ]
        []
