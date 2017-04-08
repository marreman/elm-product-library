module ProductLib.Main
    exposing
        ( Model
        , Msg
        , init
        , update
        , view
        , style
        )

import ProductLib.Types as Types
import ProductLib.Update as Update
import ProductLib.View as View
import ProductLib.Style as Style


type alias Model =
    Types.Model


init : Model
init =
    { products =
        [ Types.Product "Chocolate cupcake" 7.9
        , Types.Product "Strawberry cupcake" 13.9
        , Types.Product "Raspberry cupcake" 5.5
        , Types.Product "Healty cupcake" 12.5
        ]
    , formName = ""
    , formPrice = ""
    , isModalOpen = False
    }


type alias Msg =
    Types.Msg


update =
    Update.update


view =
    View.view


style =
    Style.style
