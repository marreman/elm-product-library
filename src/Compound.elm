module Compound exposing (..)


type Compound a
    = Compound a a (List a)


first : Compound a -> a
first (Compound first _ _) =
    first


second : Compound a -> a
second (Compound _ second _) =
    second


rest : Compound a -> List a
rest (Compound _ _ rest) =
    rest


length : Compound a -> Int
length =
    List.length << toList


toList : Compound a -> List a
toList (Compound first second rest) =
    first :: second :: rest
