module View exposing (view)

import Html exposing (..)
import Html.CssHelpers
import Html.Events exposing (..)
import Types exposing (..)
import Styles exposing (..)


{ id, class, classList } =
    Html.CssHelpers.withNamespace Styles.ns


view : Model -> Html Msg
view model =
    div [ class [ Container ] ]
        [ div [ class [ Library ] ]
            [ viewHeader
            , viewBody
            ]
        ]


viewHeader : Html Msg
viewHeader =
    div [ class [ Header ] ]
        [ text "Product Library" ]


viewBody : Html Msg
viewBody =
    div [ class [ Body ] ]
        [ text "..." ]
