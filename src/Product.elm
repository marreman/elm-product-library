module Product exposing (..)


type ProductType
    = Single Product
    | Group String (Compound Product)


type alias Product =
    { name : String
    , price : Float
    }


type Compound product
    = Compound Product Product (List Product)


single : Product -> ProductType
single product =
    Single product


group : String -> Product -> Product -> List Product -> ProductType
group name first second rest =
    Group name <| Compound first second rest


length : Compound a -> Int
length (Compound first second rest) =
    List.length <| first :: second :: rest


priceRange : Compound a -> ( Float, Float )
priceRange (Compound first second rest) =
    let
        all =
            first :: second :: rest

        min =
            all
                |> List.map .price
                |> List.minimum
                |> Maybe.withDefault 0

        max =
            all
                |> List.map .price
                |> List.maximum
                |> Maybe.withDefault 0
    in
        ( min, max )
