module Fixpoint.Callout exposing (note, warn)

{-| Callout boxes: `.note` (green) and `.warn` (red) for asides and warnings.

Renders:

    <p class="note">…</p>
    <p class="warn">…</p>

-}

import Html exposing (Html, p)
import Html.Attributes exposing (class)


{-| A green note callout: `p.note`.
-}
note : List (Html msg) -> Html msg
note children =
    p [ class "note" ] children


{-| A red warning callout: `p.warn`.
-}
warn : List (Html msg) -> Html msg
warn children =
    p [ class "warn" ] children
