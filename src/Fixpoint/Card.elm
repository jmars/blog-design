module Fixpoint.Card exposing (view)

{-| A single feature / principle card.

Renders:

    <div class="card">
      <span class="n">n</span>
      <h3>title</h3>
      <p>…body…</p>
    </div>

-}

import Html exposing (Html, div, h3, p, span, text)
import Html.Attributes exposing (class)


{-| Render a card. `n` is the small number/letter marker (e.g. `"01"` or
`"α"`), `title` is the heading, and `body` is the paragraph content.
-}
view : { n : String, title : String, body : List (Html msg) } -> Html msg
view config =
    div [ class "card" ]
        [ span [ class "n" ] [ text config.n ]
        , h3 [] [ text config.title ]
        , p [] config.body
        ]
