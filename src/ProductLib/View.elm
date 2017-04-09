module ProductLib.View exposing (view)

import Common.Button as Button
import Html exposing (..)
import Html.Attributes exposing (src, value)
import Html.Events exposing (onClick, onInput)
import ProductLib.Style exposing (local, Class(..))
import ProductLib.Types exposing (..)


{ class, classes } =
    local


view : Model -> Html Msg
view model =
    div [ class Container ]
        [ div [ class Library ]
            [ div [ class Header ]
                [ h1 [] [ text "Product Library" ]
                , Button.withIconAndText Button.Plus "Create product" New
                ]
            , div [ class Body ]
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
    table []
        [ thead []
            [ th [] [ text "Image" ]
            , th [] [ text "Name" ]
            , th [] [ text "Price" ]
            , th [] [ text "Edit" ]
            ]
        , tbody [] <| List.map viewProduct products
        ]


viewProduct : Product -> Html Msg
viewProduct product =
    tr [ class ProductRow ]
        [ td [] [ viewProductImage ]
        , td [] [ text product.name ]
        , td [] [ text <| toString product.price ]
        , td [] [ Button.withIcon Button.Pen (Edit product) ]
        ]


viewProductImage : Html Msg
viewProductImage =
    img
        [ src "http://0x0800.github.io/2048-CUPCAKES/style/img/1024.jpg"
        , class ProductRowImage
        ]
        []


viewForm : Model -> Html Msg
viewForm model =
    div [ classes [ Fullscreen, ProductsContainer ] ]
        [ div [ classes [ Fullscreen, Overlay ], onClick Cancel ] []
        , div [ class Modal ]
            [ h2 [] [ text "New product" ]
            , div []
                [ viewInput "Name" model.formName UpdateName
                , viewInput "Price" model.formPrice UpdatePrice
                , case model.editType of
                    NewProduct ->
                        Button.withText "Create" Create

                    ExistingProduct ->
                        Button.withText "Save" Save
                ]
            ]
        ]


viewInput : String -> String -> (String -> Msg) -> Html Msg
viewInput name val msg =
    label [ class TextField ]
        [ strong [ class TextFieldLabel ] [ text name ]
        , input [ onInput msg, value val ] []
        ]
