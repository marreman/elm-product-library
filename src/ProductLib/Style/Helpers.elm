module ProductLib.Style.Helpers exposing (..)

import Css exposing (Snippet)
import Css.Namespace
import Html.CssHelpers exposing (Namespace)


css : String -> List Snippet -> (List Snippet, Namespace String class id msg)
css ns snippets =
    ( Css.Namespace.namespace (ns ++ "__") snippets
    , Html.CssHelpers.withNamespace (ns ++ "__")
    )

