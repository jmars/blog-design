module Fixpoint.Grid exposing (grid)

{-| A responsive feature grid: `div.grid`. Children are typically `Card` nodes.
-}

import Html exposing (Html, div)
import Html.Attributes exposing (class)


{-| Render a feature grid: `div.grid`.
-}
grid : List (Html msg) -> Html msg
grid children =
    div [ class "grid" ] children
