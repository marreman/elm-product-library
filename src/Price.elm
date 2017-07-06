module Price exposing (..)


type Currency
    = EUR


toCurrency : Currency -> Float -> String
toCurrency currency amount =
    case currency of
        EUR ->
            toString amount ++ " €"


rangeToCurrency : Currency -> ( Float, Float ) -> String
rangeToCurrency currency ( min, max ) =
    (toCurrency currency min) ++ " - " ++ (toCurrency currency max)
