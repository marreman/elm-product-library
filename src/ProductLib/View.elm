module ProductLib.View exposing (view, style)

import Css exposing (..)
import Css.Elements as Elements
import Html exposing (..)
import Html.Attributes as Attrs
import Html.Events exposing (..)
import ProductLib.Style.Helpers exposing (css)
import ProductLib.Style.Global exposing (..)
import ProductLib.Style.Common exposing (..)
import ProductLib.Types exposing (..)
import ProductLib.View.Modal as Modal


type CssClasses
    = Container
    | Library
    | Header
    | Body
    | ProductRow
    | ProductRowImage


( style, local ) =
    css "main" <|
        [ class Container
            [ maxWidth (px 1340)
            , margin auto
            ]
        , class Library
            [ backgroundColor colors.white
            ]
        , class Header
            [ padding2 (px 20) (px 30)
            , borderBottom3 (px 1) solid colors.lightGrey
            , displayFlex
            , alignItems center
            , children
                [ Elements.h1
                    [ fontSize (px 22)
                    , fontWeight bold
                    , margin zero
                    ]
                , Elements.button
                    [ marginLeft auto ]
                ]
            ]
        , class Body
            [ padding2 (px 30) (px 30)
            ]
        , class ProductRow
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


view : Model -> Html Msg
view model =
    div [ local.class [ Container ] ]
        [ div [ local.class [ Library ] ]
            [ viewHeader
            , viewBody model
            ]
        , if model.isModalOpen then
            Modal.view
          else
            Html.text ""
        ]


viewHeader : Html Msg
viewHeader =
    div [ local.class [ Header ] ]
        [ h1 [] [ Html.text "Product Library" ]
        , button [ onClick NewProduct ] [ Html.text "Create product" ]
        ]


viewBody : Model -> Html Msg
viewBody model =
    div [ local.class [ Body ] ]
        [ Html.table []
            [ thead []
                [ th [] [ Html.text "Image" ]
                , th [] [ Html.text "Name" ]
                , th [] [ Html.text "Price" ]
                , th [] [ Html.text "Edit" ]
                ]
            , tbody [] <| List.map viewProduct model.products
            ]
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr [ local.class [ ProductRow ] ]
        [ td [] [ viewProductImage ]
        , td [] [ Html.text product.name ]
        , td [] [ Html.text <| toString product.price ]
        , td [] [ button [] [ Html.text "e" ] ]
        ]


viewProductImage : Html Msg
viewProductImage =
    img
        [ Attrs.src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , local.class [ ProductRowImage ]
        ]
        []
