module Types exposing (..)

import ProductLib.Types


type alias Model =
    { productLibrary : ProductLib.Types.Model
    }


type Msg
    = ProductLibMsg ProductLib.Types.Msg
