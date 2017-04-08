module ProductLib.Types exposing (..)


type alias Model =
    { products : List Product
    , formName : String
    , formPrice : String
    , isModalOpen : Bool
    }


type alias Product =
    { name : String
    , price : Float
    }


type Msg
    = OpenModal
    | Create
    | Cancel
    | UpdateName String
    | UpdatePrice String
