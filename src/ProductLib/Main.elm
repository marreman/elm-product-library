module ProductLib.Main exposing (init, update, view, style, Model, Msg)

import Css exposing (..)
import Css.Elements as Elements
import Html exposing (..)
import Html.Attributes as Attrs
import Html.Events exposing (..)
import ProductLib.Style.Common exposing (..)
import ProductLib.Style.Helpers exposing (css)
import ProductLib.List
import ProductLib.Form


-- MODEL


type alias Model =
    { list : ProductLib.List.Model
    , form : ProductLib.Form.Model
    , isModalOpen : Bool
    }



-- INIT


init : Model
init =
    { list = ProductLib.List.init
    , form = ProductLib.Form.init
    , isModalOpen = False
    }



-- UPDATE


type Msg
    = FormMsg ProductLib.Form.Msg
    | OpenModal


update : Msg -> Model -> Model
update msg model =
    case msg of
        FormMsg msg ->
            case msg of
                ProductLib.Form.Cancel ->
                    { model | isModalOpen = False }

                ProductLib.Form.Create ->
                    let
                        newProduct =
                            { id = "1"
                            , name = model.form.name
                            , price = model.form.price
                            }
                    in
                        { model
                            | list = newProduct :: model.list
                            , form = ProductLib.Form.update msg model.form
                            , isModalOpen = False
                        }

                _ ->
                    { model | form = ProductLib.Form.update msg model.form }

        OpenModal ->
            { model | isModalOpen = True }



-- VIEW


view : Model -> Html Msg
view model =
    div [ local.class [ Container ] ]
        [ div [ local.class [ Library ] ]
            [ div [ local.class [ Header ] ]
                [ h1 [] [ Html.text "Product Library" ]
                , button [ onClick OpenModal ] [ Html.text "Create product" ]
                ]
            , div [ local.class [ Body ] ]
                [ ProductLib.List.view model.list
                , if model.isModalOpen then
                    Html.map FormMsg ProductLib.Form.view
                  else
                    Html.text ""
                ]
            ]
        ]



-- STYLE


type CssClasses
    = Container
    | Library
    | Header
    | Body


( style, local ) =
    css "ProductLib_Main" <|
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
        ]
