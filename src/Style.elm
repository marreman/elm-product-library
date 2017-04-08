port module Style exposing (..)

import Css
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Common.Style
import ProductLib.Style


style : Css.Stylesheet
style =
    Css.stylesheet <|
        List.concat
            [ Common.Style.style
            , ProductLib.Style.style
            ]


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "main.css", Css.File.compile [ style ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
