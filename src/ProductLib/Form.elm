module ProductLib.Form
    exposing
        ( Model
        , init
        , Msg
            ( Create
            , Cancel
            )
        , update
        , view
        , style
        )

import Css exposing (..)
import Css.Elements as Element
import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import ProductLib.Style.Helpers exposing (css)


-- MODEL


type alias Model =
    { name : String
    , price : Float
    }



-- INIT


init : Model
init =
    { name = ""
    , price = 0
    }



-- UPDATE


type Msg
    = UpdateName String
    | UpdatePrice String
    | Create
    | Cancel


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateName name ->
            { model | name = name }

        UpdatePrice price ->
            { model | price = String.toFloat price |> Result.withDefault 0 }

        Create ->
            model

        -- handled by parent
        Cancel ->
            model



-- handled by parent
-- VIEW


view : Html Msg
view =
    div [ local.class [ Fullscreen, Container ] ]
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



-- STYLE


type CssClasses
    = Fullscreen
    | Container
    | Overlay
    | Modal
    | TextField
    | TextFieldLabel
    | TextFieldInput


( style, local ) =
    css "ProductLib_Form" <|
        [ class Fullscreen
            [ position absolute
            , top zero
            , left zero
            , width (pct 100)
            , height (pct 100)
            ]
        , class Container
            [ displayFlex
            , justifyContent center
            , alignItems center
            ]
        , class Overlay
            [ backgroundColor (rgba 0 0 0 0.5) ]
        , class Modal
            [ backgroundColor (rgb 255 255 255)
            , width (px 500)
            , padding3 (px 10) (px 30) (px 40)
            , position relative
            ]
        , class TextField
            [ display block
            , marginBottom (px 20)
            , children
                [ Element.input
                    [ width (pct 100) ]
                ]
            ]
        , class TextFieldLabel
            [ display block
            , marginBottom (px 10)
            ]
        ]
