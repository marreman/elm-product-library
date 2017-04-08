module ProductLib.View exposing (view)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (src, value)
import ProductLib.Types exposing (..)
import ProductLib.Style exposing (..)


view : Model -> Html Msg
view model =
    div [ local.class [ Container ] ]
        [ div [ local.class [ Library ] ]
            [ div [ local.class [ Header ] ]
                [ h1 [] [ Html.text "Product Library" ]
                , button [ onClick New ] [ Html.text "Create product" ]
                ]
            , div [ local.class [ Body ] ]
                [ viewProducts model.products
                , if model.isModalOpen then
                    viewForm model
                  else
                    text ""
                ]
            ]
        ]


viewProducts : List Product -> Html Msg
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


viewProduct : Product -> Html Msg
viewProduct product =
    tr [ local.class [ ProductRow ] ]
        [ td [] [ viewProductImage ]
        , td [] [ Html.text product.name ]
        , td [] [ Html.text <| toString product.price ]
        , td [] [ button [ onClick (Edit product) ] [ Html.text "Edit" ] ]
        ]


viewProductImage : Html Msg
viewProductImage =
    img
        [ src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , local.class [ ProductRowImage ]
        ]
        []


viewForm : Model -> Html Msg
viewForm model =
    div [ local.class [ Fullscreen, ProductsContainer ] ]
        [ div [ local.class [ Fullscreen, Overlay ], onClick Cancel ] []
        , div [ local.class [ Modal ] ]
            [ h2 [] [ Html.text "New product" ]
            , div []
                [ viewInput "Name" model.formName UpdateName
                , viewInput "Price" model.formPrice UpdatePrice
                , case model.editType of
                    NewProduct ->
                        button [ onClick Create ] [ Html.text "Create" ]
                    ExistingProduct ->
                        button [ onClick Save ] [ Html.text "Save" ]
                ]
            ]
        ]


viewInput : String -> String -> (String -> Msg) -> Html Msg
viewInput name val msg =
    label [ local.class [ TextField ] ]
        [ strong [ local.class [ TextFieldLabel ] ] [ Html.text name ]
        , input [ onInput msg, value val ] []
        ]
