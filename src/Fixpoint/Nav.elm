module Fixpoint.Nav exposing (Config, dropdown, homeLink, link, menuItem, menuItemClass, menuItemFx, view)

{-| The sticky top navigation bar.

Renders the site's nav structure exactly as the canonical stylesheet expects:

    <nav>
      <div class="wrap">
        <span class="brand">…</span>
        <span class="links">…</span>
      </div>
    </nav>

`links` are the ordinary anchor links rendered inside `span.links`; `extra`
holds any additional items appended at the end of the links row — typically
the `components` `dropdown`. `brand` is the monospace brand (e.g. an `fx`
span plus `://…` text).

-}

import Html exposing (Html, a, button, div, nav, span, text)
import Html.Attributes exposing (attribute, class, href)


{-| Everything `view` needs: the brand, the plain anchor links, and any extra
items (such as a `dropdown`) rendered after the links inside the links row.
-}
type alias Config msg =
    { brand : Html msg
    , links : List (Html msg)
    , extra : List (Html msg)
    }


{-| Render the full sticky nav. `extra` items appear after `links`, still
inside `span.links`.
-}
view : Config msg -> Html msg
view config =
    nav []
        [ div [ class "wrap" ]
            [ span [ class "brand" ] [ config.brand ]
            , span [ class "links" ] (config.links ++ config.extra)
            ]
        ]


{-| A plain nav link: `a[href=url][label]`. Used for the ordinary anchor links
in the links row.
-}
link : String -> String -> Html msg
link url label =
    a [ href url ] [ text label ]


{-| A highlighted nav link (`a.home`) for a call-to-action or back-to-org
link. Styled by the `nav .links a.home` rule.
-}
homeLink : String -> String -> Html msg
homeLink url label =
    a [ class "home", href url ] [ text label ]


{-| A plain dropdown menu link: `a[href=url][label]`.
-}
menuItem : String -> String -> Html msg
menuItem url label =
    a [ href url ] [ text label ]


{-| A dropdown menu link with an extra class — e.g. `"ddhake"` or `"dfxstore"`
to highlight a component. Argument order: `className`, `url`, `label`.
-}
menuItemClass : String -> String -> String -> Html msg
menuItemClass className url label =
    a [ class className, href url ] [ text label ]


{-| A dropdown menu link with an `fx`-accented label and a trailing arrow:

    a[href=url][ span.fx[label] " →" ]

-}
menuItemFx : String -> String -> Html msg
menuItemFx url label =
    a [ href url ]
        [ span [ class "fx" ] [ text label ]
        , text " →"
        ]


{-| The "components" hover submenu: `span.dropdown` wrapping a `button.toggle`
and a `span.menu` of items. Hover-visible via the `:hover` CSS rule.
-}
dropdown : { toggle : String, items : List (Html msg) } -> Html msg
dropdown config =
    span [ class "dropdown" ]
        [ button [ class "toggle", attribute "aria-haspopup" "true" ] [ text config.toggle ]
        , span [ class "menu", attribute "role" "menu" ] config.items
        ]
