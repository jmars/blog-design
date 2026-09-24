module Fixpoint.Hero exposing (Config, blink, dollar, fx, hash, view)

{-| The hero / masthead.

Renders:

    <header>
      <div class="wrap">
        <div class="prompt">…</div>
        <h1>…</h1>
        <div class="tagline">…</div>
      </div>
    </header>

Build the `prompt` and `title` lists with the small helpers here (`hash`,
`dollar`, `blink` for the prompt line; `fx` for an accented `h1 .fx` span).

-}

import Html exposing (Html, div, h1, header, span, text)
import Html.Attributes exposing (class)


{-| The hero content: the prompt line, the `h1` title, and the tagline. Each
field is a list of child nodes rendered inside its styled container.
-}
type alias Config msg =
    { prompt : List (Html msg)
    , title : List (Html msg)
    , tagline : List (Html msg)
    }


{-| Render the hero header.
-}
view : Config msg -> Html msg
view config =
    header []
        [ div [ class "wrap" ]
            [ div [ class "prompt" ] config.prompt
            , h1 [] config.title
            , div [ class "tagline" ] config.tagline
            ]
        ]


{-| The prompt hash glyph: `span.hash` containing `#`.
-}
hash : Html msg
hash =
    span [ class "hash" ] [ text "#" ]


{-| The prompt dollar glyph: `span.dollar` containing `$`.
-}
dollar : Html msg
dollar =
    span [ class "dollar" ] [ text "$" ]


{-| The blinking cursor: `span.blink` containing `▊`. Blinks via the
`@keyframes blink` rule.
-}
blink : Html msg
blink =
    span [ class "blink" ] [ text "▊" ]


{-| An accented span (`span.fx`) used to colour part of a headline or brand in
the accent colour. Rendered wherever the stylesheet styles `.fx` (hero `h1`,
nav brand, dropdown menu items).
-}
fx : List (Html msg) -> Html msg
fx children =
    span [ class "fx" ] children
