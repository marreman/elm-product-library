module Style exposing (style)

import Css
import Common.Style
import ProductLib.Style


style : Css.Stylesheet
style =
    Css.stylesheet <|
        List.concat
            [ Common.Style.style
            , ProductLib.Style.style
            ]
