module ProductLib.View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (src)
import ProductLib.Types exposing (..)
import ProductLib.Style exposing (..)


view : Model -> Html Msg
view model =
    div [ local.class [ Container ] ]
        [ div [ local.class [ Library ] ]
            [ div [ local.class [ Header ] ]
                [ h1 [] [ Html.text "Product Library" ]
                , button [ onClick OpenModal ] [ Html.text "Create product" ]
                ]
            , div [ local.class [ Body ] ]
                [ viewProducts model.products
                , if model.isModalOpen then
                    viewForm
                  else
                    text ""
                ]
            ]
        ]


viewProducts : List Product -> Html msg
viewProducts products =
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
        [ src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , local.class [ ProductRowImage ]
        ]
        []


viewForm : Html Msg
viewForm =
    div [ local.class [ Fullscreen, ProductsContainer ] ]
        [ div [ local.class [ Fullscreen, Overlay ], onClick Cancel ] []
        , div [ local.class [ Modal ] ]
            [ h2 [] [ Html.text "New product" ]
            , div []
                [ viewInput UpdateName "Name"
                , viewInput UpdatePrice "Price"
                , button [ onClick Create ] [ Html.text "Create" ]
                ]
            ]
        ]


viewInput : (String -> Msg) -> String -> Html Msg
viewInput msg name =
    label [ local.class [ TextField ] ]
        [ strong [ local.class [ TextFieldLabel ] ] [ Html.text name ]
        , input [ onInput msg ] []
        ]
