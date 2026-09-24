# blog-design

A **light "paper" fork** of the [fixpoint-linux](https://fixpointlinux.org)
design system, for long-form reading: same chrome, warm light theme, and
reading-optimized prose typography built into the stylesheet.

## What changed vs upstream

- **Theme**: the dark terminal palette is inverted to a warm light "paper"
  theme (`--bg #fbfaf7`, `--fg #1b1b1d`, deep green accent). Only
  `src/Fixpoint/Style.elm` differs from upstream; every other module is
  byte-identical.
- **Reading typography**: a `.prose` article-body layer (serif body at 19px /
  1.72, capped 42rem measure, styled links, blockquotes, code, tables,
  footnotes) is now part of the design system itself.
- **Nothing else.** Elm module names (`Fixpoint.*`) and every CSS class name
  (`.prompt`, `.wrap`, `.grid`, `.card`, `.stack`, `.note`, `.warn`,
  `.cta-banner`, …) are unchanged — a drop-in fork.

## Consume it

Add this repo as a git submodule and put its `src` in your `elm.json`
`source-directories`, then use it exactly like upstream:

```elm
import Fixpoint.Style
import Fixpoint.Nav
import Fixpoint.Hero
-- …

view model =
    div []
        [ Fixpoint.Style.stylesheet   -- carries the full stylesheet into the page
        , Fixpoint.Nav.view { brand = …, links = …, extra = … }
        , Fixpoint.Hero.view { … }
        ]
```

`Fixpoint.Style.stylesheet` emits a single `<style>` node with the whole
canonical stylesheet (paper tokens + all component rules + the `.prose`
reading layer), so a static pre-render (SSG) carries the styling into the
emitted HTML — self-contained. `Fixpoint.Style.css` exposes the same string
for embedding in an existing `<style>` element.

## Modules

`Style` (css + stylesheet), `Nav`, `Hero`, `Section`, `Grid`, `Card`, `Code`,
`Footer`, `Checks`, `Headline`, `Cta`, `Callout`.

Upstream: [fixpoint-linux design](https://github.com/fixpoint-linux/design) —
see `fixpointlinux.org` for the canonical dark look.
