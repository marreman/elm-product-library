module Dialog exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { isOpen : Bool }


init : Model
init =
    { isOpen = False }


type Msg
    = Open
    | Close
    | UpdateName String
    | UpdatePrice String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Open ->
            { model | isOpen = True }

        Close ->
            { model | isOpen = False }

        _ ->
            Debug.crash "NOT IMPLEMENTED"


view : Model -> Html Msg
view model =
    div []
        [ div [ class "overlay", onClick Close ] []
        , div [ class "dialog" ]
            [ header []
                [ h2 [] [ text "New Product" ]
                , button [ class "dialog-close", onClick Close ] [ text "×" ]
                ]
            , main_ [ class "dialog-body" ]
                [ Html.form []
                    [ label []
                        [ text "Name"
                        , input
                            [ type_ "text"
                            , required True
                            , onInput UpdateName
                            ]
                            []
                        ]
                    , label []
                        [ text "Price"
                        , input
                            [ type_ "number"
                            , required True
                            , Html.Attributes.min "0"
                            , onInput UpdatePrice
                            ]
                            []
                        ]
                    , footer [ class "dialog-footer" ]
                        [ button [ class "button", type_ "submit" ] [ text "Create" ] ]
                    ]
                ]
            ]
        ]
