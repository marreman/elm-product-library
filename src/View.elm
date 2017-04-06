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
    div [ class [ Container ] ] [ Html.text "test" ]
