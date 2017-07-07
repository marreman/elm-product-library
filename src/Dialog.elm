module Dialog exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Dialog =
    { isOpen : Bool }


init : Dialog
init =
    { isOpen = False }


type Msg
    = Open
    | Close
    | UpdateName String
    | UpdatePrice String


update : Msg -> Dialog -> Dialog
update msg dialog =
    case msg of
        Open ->
            { dialog | isOpen = True }

        Close ->
            { dialog | isOpen = False }

        _ ->
            Debug.crash "NOT IMPLEMENTED"


view : Dialog -> Html Msg
view dialog =
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
