module Types exposing (..)


type alias Model =
    { products : List Product
    , newProductText : String
    }


type alias Product =
    { id : String
    , name : String
    }


type Msg
    = NoOp
    | NewProductText String
    | Create
