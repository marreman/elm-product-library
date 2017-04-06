module Css.Main exposing (..)

import Css exposing (stylesheet)
import Css.Namespace exposing (namespace)
import Css.Common
import Css.Global
import View.Modal


css =
    (stylesheet << namespace Css.Common.ns) <|
        List.concat
            [ Css.Global.css
            , View.Modal.css
            ]
