module Product exposing (..)

import Compound exposing (Compound(..))


type ProductType
    = Single Product
    | Group String (Compound Product)


type alias Product =
    { name : String
    , price : Float
    }


single : Product -> ProductType
single product =
    Single product


group : String -> Product -> Product -> List Product -> ProductType
group name first second rest =
    Group name <| Compound first second rest


length : Compound a -> Int
length =
    Compound.length


priceRange : Compound Product -> ( Float, Float )
priceRange compound =
    let
        prices =
            Compound.toList compound
                |> List.map .price
    in
        ( prices
            |> List.minimum
            |> Maybe.withDefault 0
        , prices
            |> List.maximum
            |> Maybe.withDefault 0
        )
