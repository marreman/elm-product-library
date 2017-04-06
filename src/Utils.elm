module Utils exposing (..)


id : List Int -> Int
id xs =
    xs
        |> List.maximum
        |> Maybe.withDefault 0
        |> (+) 1
