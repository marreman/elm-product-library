port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import ProductLib.Style.Main


port files : CssFileStructure -> Cmd msg


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "main.css", Css.File.compile [ ProductLib.Style.Main.style ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
