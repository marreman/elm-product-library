module Types exposing (..)


type alias Model =
    { products : List Product
    , newProductText : String
    , isModalOpen : Bool
    }


type alias Product =
    { id : String
    , name : String
    , price : Float
    }


type Msg
    = NoOp
    | NewProductText String
    | Create
    | NewProduct
