module View exposing (view)

import Html exposing (..)
import Html.CssHelpers
import Html.Attributes exposing (src)
import Html.Events exposing (..)
import Types exposing (..)
import Css.Common exposing (cls)
import Css.Global exposing (..)
import View.Modal


view : Model -> Html Msg
view model =
    div [ cls Container ]
        [ div [ cls Library ]
            [ viewHeader
            , viewBody model
            ]
        , if model.isModalOpen then
            View.Modal.view
          else
            text ""
        ]


viewHeader : Html Msg
viewHeader =
    div [ cls Header ]
        [ h1 [] [ text "Product Library" ]
        , button [ onClick NewProduct ] [ text "Create product" ]
        ]


viewBody : Model -> Html Msg
viewBody model =
    div [ cls Body ]
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
    tr [ cls ProductRow ]
        [ td [] [ viewProductImage ]
        , td [] [ text product.name ]
        , td [] [ text <| toString product.price ]
        , td [] [ button [] [ text "e" ] ]
        ]


viewProductImage : Html Msg
viewProductImage =
    img
        [ src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , cls ProductRowImage
        ]
        []
