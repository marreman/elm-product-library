module ProductLib.Types exposing (..)


type alias Model =
    { products : List Product
    , isModalOpen : Bool
    }


type alias Product =
    { id : String
    , name : String
    , price : Float
    }


type Msg
    = NoOp
    | NewProduct
    | CloseModal
