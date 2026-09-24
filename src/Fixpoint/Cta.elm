module Fixpoint.Cta exposing (view)

{-| Call-to-action banner: `.cta-banner` with a `.cta-btn` link.

Renders:

    <div class="cta-banner">
      <div>…body…</div>
      <a class="cta-btn" href="…">label</a>
    </div>

-}

import Html exposing (Attribute, Html, a, div, text)
import Html.Attributes exposing (class, href)


{-| A CTA banner with a button-style link.

`body` is a list of `Html msg` for the left-hand content.
`href` is the link target.
`label` is the button text.
`attrs` are extra attributes applied to the `a.cta-btn` — e.g.
`attribute "data-mfe-route" "/…"` for in-shell MFE navigation.

-}
view : { body : List (Html msg), href : String, label : String, attrs : List (Attribute msg) } -> Html msg
view config =
    div [ class "cta-banner" ]
        [ div [] config.body
        , a ([ class "cta-btn", href config.href ] ++ config.attrs) [ text config.label ]
        ]
