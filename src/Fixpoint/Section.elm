module Fixpoint.Section exposing (view)

{-| A content section with a sticky-anchor id, a heading and a hint.

Renders:

    <section id="…">
      <div class="wrap">
        <h2>title</h2>
        <div class="hint">hint</div>
        …children…
      </div>
    </section>

`children` are appended as siblings after the heading and hint — exactly where
the canonical stylesheet styles paragraphs, grids, tables, code blocks, etc.

-}

import Html exposing (Html, div, h2, section, text)
import Html.Attributes exposing (class, id)


{-| Render a section. `id` is the anchor (e.g. `"idea"`), `title` becomes the
`h2`, `hint` becomes the `div.hint` subtitle, and `children` are the section
body.
-}
view : { id : String, title : String, hint : String, children : List (Html msg) } -> Html msg
view config =
    section [ id config.id ]
        [ div [ class "wrap" ]
            ([ h2 [] [ text config.title ]
             , div [ class "hint" ] [ text config.hint ]
             ]
                ++ config.children
            )
        ]
