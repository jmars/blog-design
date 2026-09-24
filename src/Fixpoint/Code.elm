module Fixpoint.Code exposing (block, c, g, inline, k)

{-| Terminal-style code blocks (`pre.code`) with the canonical `.c` (dim /
comment), `.g` (accent) and `.k` (accent2) colour spans.

Build a `block` from a list of `text` nodes and the colour helpers, e.g.:

    Code.block
        [ Code.c "# build the Dhall interpreter"
        , text "\\n"
        , Code.k "$"
        , text " "
        , Code.g "cd"
        , text " dhall-c"
        ]

-}

import Html exposing (Html, code, pre, span, text)
import Html.Attributes exposing (class)


{-| A code block: `pre.code`.
-}
block : List (Html msg) -> Html msg
block children =
    pre [ class "code" ] children


{-| A dim / comment span: `span.c`.
-}
c : String -> Html msg
c s =
    span [ class "c" ] [ text s ]


{-| An accent span: `span.g` (typically command names).
-}
g : String -> Html msg
g s =
    span [ class "g" ] [ text s ]


{-| An accent-2 span: `span.k` (typically `$` prompts / keywords).
-}
k : String -> Html msg
k s =
    span [ class "k" ] [ text s ]


{-| Inline code: `code[text s]`. Styled by the `p code, li code` rule.
-}
inline : String -> Html msg
inline s =
    code [] [ text s ]
