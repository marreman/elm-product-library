module ProductLib.Style exposing (style)

import Css exposing (Snippet)
import ProductLib.Main
import ProductLib.List
import ProductLib.Form


style : List Snippet
style =
    List.concat
        [ ProductLib.Main.style
        , ProductLib.List.style
        , ProductLib.Form.style
        ]
