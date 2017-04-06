module ProductLib.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (..)
import ProductLib.Style.Common exposing (cls)
import ProductLib.Style.Global exposing (..)
import ProductLib.Types exposing (..)
import ProductLib.View.Modal as Modal


view : Model -> Html Msg
view model =
    div [ cls Container ]
        [ div [ cls Library ]
            [ viewHeader
            , viewBody model
            ]
        , if model.isModalOpen then
            Modal.view
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
