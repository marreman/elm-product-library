module ProductLib.Types exposing (..)


type alias Model =
    { products : List Product
    , formId : Int
    , formName : String
    , formPrice : String
    , isModalOpen : Bool
    , editType : EditType
    }


type alias Product =
    { id : Int
    , name : String
    , price : Float
    }


type EditType
    = NewProduct
    | ExistingProduct


type Msg
    = New
    | Create
    | Save
    | Cancel
    | Edit Product
    | UpdateName String
    | UpdatePrice String
