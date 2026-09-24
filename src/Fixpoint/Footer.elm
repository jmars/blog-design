module Fixpoint.Footer exposing (sep, view)

{-| The page footer.

Renders:

    <footer>
      <div class="wrap">…children…</div>
    </footer>

Children are typically anchor links, `text` nodes and `sep` markers.

-}

import Html exposing (Html, div, footer, span, text)
import Html.Attributes exposing (class)


{-| Render the footer. `children` are placed inside `div.wrap`.
-}
view : List (Html msg) -> Html msg
view children =
    footer [] [ div [ class "wrap" ] children ]


{-| A separator dot: `span.sep` containing `·`.
-}
sep : Html msg
sep =
    span [ class "sep" ] [ text " · " ]
