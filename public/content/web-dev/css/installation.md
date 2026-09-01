# CSS & Modern Layout — Setup

CSS has no installer, no runtime, and no package to download — a browser already knows how to read it. "Setup" for CSS means setting up a productive *workflow* around it: an editor, a way to see changes instantly, and the browser tooling that's the actual day-to-day CSS toolchain. This page is honest about that — there's no `npm install css` step, and pretending otherwise would just add noise.

## 1. A Code Editor (required)

Any editor that saves plain text works, but **VS Code** (free) is the most common choice for CSS work specifically because of its built-in CSS IntelliSense (autocomplete for property names and values) and the ecosystem of extensions below. Sublime Text, WebStorm, and Neovim (with an LSP plugin) are all genuinely fine alternatives if already preferred.

**Recommended VS Code extensions:**
- **Live Server** — serves a local HTML/CSS file with automatic browser refresh on save; the single highest-value setup step on this page for actually seeing changes instantly instead of manually refreshing.
- **CSS Peek** — jump from a class used in HTML straight to its CSS definition.

## 2. Live Reload — Seeing Changes Instantly

For plain HTML/CSS with no build tool, install the **Live Server** VS Code extension, right-click any `.html` file, and choose "Open with Live Server" — it opens the page in a browser tab and auto-refreshes on every save. This single habit — save and immediately see the result — is what makes learning CSS by experimentation actually fast; constantly re-opening a file manually is a real, avoidable friction point for a beginner.

```bash
# Alternative for any project already using Node.js tooling:
npx live-server
# Serves the current directory with auto-reload, no VS Code required
```

## 3. Browser DevTools — the Real CSS Toolchain

This is the part genuinely worth calling "installation," because it's the tool actually used for CSS work day to day, and it's already installed in every browser:

- **Elements panel** — inspect any element on the page, see its actual HTML in the live DOM (which can differ from the original source after JavaScript runs).
- **Styles panel** (inside Elements) — shows every CSS rule applying to the selected element, in cascade order, with specificity conflicts visibly struck through when overridden. This is the fastest way to answer "why isn't my style applying" — the answer is almost always visible directly in this panel.
- **Computed panel** — shows the final, resolved value of every property after the cascade has been applied — useful when several rules are fighting and it's unclear what actually won.
- **Layout panel** — toggles a visual overlay on Flexbox and Grid containers showing the actual tracks/lines being used; genuinely one of the most useful additions to modern DevTools for debugging layout.

Open DevTools with `F12` or `Ctrl+Shift+I` (Windows/Linux) / `Cmd+Option+I` (Mac) in any Chromium-based browser or Firefox.

## 4. CSS Preprocessors and PostCSS (optional, advanced path)

Not required to learn or use CSS — modern CSS itself now has custom properties, nesting, and other features that used to be preprocessor-only reasons to reach for Sass. That said, many production codebases still use:

- **Sass/SCSS** — adds compile-time variables, nesting, and mixins; compiles down to plain CSS before shipping.
- **PostCSS** — a transformation pipeline (autoprefixer for vendor prefixes, `postcss-preset-env` for using tomorrow's CSS syntax today) rather than a full language on top of CSS.

```bash
# Sass, if a project uses it — compiles style.scss to style.css on save
npm install -D sass
npx sass --watch style.scss:style.css
```

This course teaches raw, modern CSS throughout — Sass/PostCSS are mentioned here only because they're common in real codebases, not because they're required to follow along.

## Quick Verification

Create a file `test.html` with a linked `style.css`, add `body { background: lightblue; }`, open it with Live Server, then change the color and save — confirm the browser tab updates without a manual refresh. If it does, the workflow this entire course relies on is working correctly.
