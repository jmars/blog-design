module Fixpoint.Headline exposing (card, view)

{-| Headline feature cards: a responsive grid of `.headline-card` elements.

Renders:

    <div class="headline">…</div>

and for `card`:

    <div class="headline-card">
      <span class="n">n</span>
      <h3>…title…</h3>
      …body…
    </div>

-}

import Html exposing (Html, div, h3, span, text)
import Html.Attributes exposing (class)


{-| A headline grid container: `div.headline`.
-}
view : List (Html msg) -> Html msg
view children =
    div [ class "headline" ] children


{-| A single headline card: `div.headline-card`.

`n` is the small number/letter marker (e.g. `"01"` or `"α"`).
`title` and `body` are lists of `Html msg` (unlike `Fixpoint.Card` which takes a
`String` title).

-}
card : { n : String, title : List (Html msg), body : List (Html msg) } -> Html msg
card config =
    div [ class "headline-card" ]
        ([ span [ class "n" ] [ text config.n ]
         , h3 [] config.title
         ]
            ++ config.body
        )
