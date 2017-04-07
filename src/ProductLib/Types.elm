module ProductLib.Types exposing (..)

import Dict exposing (Dict)


type alias Model =
    { products : List Product
    , isModalOpen : Bool
    , newProduct : Dict String String
    }


type alias Product =
    { id : String
    , name : String
    , price : Float
    }


type Msg
    = NoOp
    | NewProduct
    | UpdateNewProduct String String
    | CreateNewProduct
    | CloseModal
