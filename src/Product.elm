module Product exposing (..)

import Compound exposing (Compound(..))


type ProductType
    = Single Product
    | Group GroupInfo (Compound Product)


type alias Product =
    { name : String
    , price : Float
    }


type alias GroupInfo =
    { id : Int
    , name : String
    , isOpen : Bool
    }


single : Product -> ProductType
single product =
    Single product


group : Int -> String -> Product -> Product -> List Product -> ProductType
group id name first second rest =
    Group (GroupInfo id name False) <| Compound first second rest


length : Compound a -> Int
length =
    Compound.length


toList : Compound a -> List a
toList =
    Compound.toList


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


toggleGroup : ProductType -> ProductType
toggleGroup productType =
    case productType of
        Single _ ->
            productType

        Group info products ->
            Group { info | isOpen = not info.isOpen } products
