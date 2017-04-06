port module Stylesheets exposing (..)

import Css exposing (..)
import Css.Elements exposing (body)
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Css.Namespace exposing (namespace)


port files : CssFileStructure -> Cmd msg


css =
    (stylesheet << namespace "iz-product-library")
        [ body
            [ backgroundColor (hex "eceeef")
            , margin zero
            ]
        ]


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "main.css", Css.File.compile [ css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
