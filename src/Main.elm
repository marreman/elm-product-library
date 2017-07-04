module Main exposing (main)

import Html exposing (..)


main =
    beginnerProgram
        { model = model
        , update = update
        , view = view
        }


type alias Model =
    {}


model : Model
model =
    {}


type Msg
    = Noop


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    main_ [] [ text (toString model) ]
