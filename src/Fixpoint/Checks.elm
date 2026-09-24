module Fixpoint.Checks exposing (view)

{-| A checklist: `ul.checks`. Pass pre-built `li` items — each gets its leading
checkmark from the `ul.checks li::before` CSS rule.
-}

import Html exposing (Html, ul)
import Html.Attributes exposing (class)


{-| Render a checklist: `ul.checks`.
-}
view : List (Html msg) -> Html msg
view items =
    ul [ class "checks" ] items
