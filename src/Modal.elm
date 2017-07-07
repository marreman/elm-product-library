module Modal exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Modal =
    { isOpen : Bool }


init : Modal
init =
    { isOpen = False }


type Msg
    = Open
    | Close
    | UpdateName String
    | UpdatePrice String


update : Msg -> Modal -> Modal
update msg modal =
    case msg of
        Open ->
            { modal | isOpen = True }

        Close ->
            { modal | isOpen = False }

        _ ->
            Debug.crash "NOT IMPLEMENTED"


view : Modal -> Html Msg
view modal =
    div []
        [ div [ class "overlay", onClick Close ] []
        , div [ class "modal" ]
            [ header []
                [ h2 [] [ text "New Product" ]
                , button [ class "modal-close", onClick Close ] [ text "×" ]
                ]
            , main_ [ class "modal-body" ]
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
                    , footer [ class "modal-footer" ]
                        [ button [ class "button", type_ "submit" ] [ text "Create" ] ]
                    ]
                ]
            ]
        ]
