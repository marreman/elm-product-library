module ProductLib.Style.Main exposing (..)

import Css exposing (Stylesheet)
import ProductLib.Style.Global
import ProductLib.View
import ProductLib.View.Modal


style : Stylesheet
style =
    Css.stylesheet <|
        List.concat
            [ ProductLib.Style.Global.style
            , ProductLib.View.style
            , ProductLib.View.Modal.style
            ]
