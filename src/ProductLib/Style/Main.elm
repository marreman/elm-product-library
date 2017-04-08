module ProductLib.Style.Main exposing (..)

import Css exposing (Stylesheet)
import ProductLib.Style.Global
import ProductLib.Main
import ProductLib.List
import ProductLib.Form


style : Stylesheet
style =
    Css.stylesheet <|
        List.concat
            [ ProductLib.Style.Global.style
            , ProductLib.Main.style
            , ProductLib.List.style
            , ProductLib.Form.style
            ]
