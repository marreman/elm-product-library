module ProductLib.Style.Main exposing (..)

import Css
import Css.Namespace
import ProductLib.Style.Common
import ProductLib.Style.Global
import ProductLib.View.Modal


css =
    style
        |> Css.Namespace.namespace ProductLib.Style.Common.namespace
        |> Css.stylesheet


style =
    List.concat
        [ ProductLib.Style.Global.style
        , ProductLib.View.Modal.style
        ]
