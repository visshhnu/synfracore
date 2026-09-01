# CSS — FAQ

## Is CSS "just styling" — not really a real programming skill?

This is a common dismissal, and it doesn't hold up under any real scrutiny. CSS has its own conflict-resolution algorithm (the cascade), its own layout engines (Flexbox and Grid are genuinely sophisticated systems for solving space-distribution problems), and produces some of the most visible, highest-stakes bugs a real product ships — a broken layout or an accessibility-breaking contrast issue is immediately, publicly visible in a way a lot of backend bugs aren't. Writing CSS that's maintainable at scale (predictable specificity, a real architecture, genuine responsiveness) is a distinct, non-trivial skill that a lot of otherwise strong developers are genuinely weak at, specifically because it's often dismissed as "not real work" and under-practiced as a result.

## Do I even need to learn raw CSS if I'm just going to use Tailwind/a framework anyway?

Yes, and this matters more than it might seem — Tailwind's utility classes are still generating and applying actual CSS rules underneath, still resolved by the same cascade, box model, and Flexbox/Grid mechanics this course covers. Knowing raw CSS is what lets you actually understand what `flex items-center justify-between` is doing rather than copying it because it "worked before," debug a genuinely broken layout a framework's utilities didn't anticipate, and work on the (still very common) codebases that don't use a utility framework at all.

## Why does my CSS rule just... not apply, even though the selector looks right?

The single most common cause is a specificity conflict — a different rule, possibly one you forgot existed, is winning the cascade for that property on that element. Open DevTools, select the element, and read the Styles panel top to bottom — every applying rule is listed, and anything losing the cascade shows with a visible strikethrough, telling you exactly which rule is beating yours and why. This is almost never a browser caching issue or a "CSS is broken" situation, despite how it can feel in the moment.

## Is Flexbox "outdated" now that Grid exists?

No — this is a genuine misconception, not a nuanced truth being oversimplified. Flexbox and Grid solve different problems: Flexbox is the right tool for one-dimensional distribution and alignment (a navbar, a button group, aligning content inside a single card), and Grid is the right tool once a layout genuinely needs both rows and columns controlled together. Production layouts commonly use both at once — Grid for the outer page structure, Flexbox nested inside individual regions — rather than treating them as competing, mutually exclusive choices.

## Is it safe to use container queries and `:has()` in production yet?

For most current production audiences, yes — both have real, broad support across current major browsers today `(needs verification — check the exact current percentage on caniuse.com before citing a specific number, since browser support moves and general impressions go stale)`. The actual discipline here isn't "wait indefinitely to be safe" or "assume anything reasonably recent is fine" — it's checking caniuse.com against the specific browser-support target for the project in question before shipping either as a load-bearing feature.

## Why do people say `rem` is "safer" than `em` — aren't they basically the same thing?

They resolve differently in a way that matters in practice: `em` is relative to the *current* element's own font-size and compounds through nested elements that also set their own font-size — three nested elements each setting `1.2em` don't stay at a fixed multiple of the root, they multiply against each other. `rem` is relative only to the root (`html`) element's font-size, so it stays predictable regardless of nesting depth. `em` is still genuinely useful for values that should scale specifically with one element's own font-size (padding on a button that should grow proportionally with that button's text) — it's not that `em` is wrong, just that `rem` is the safer default for general spacing where compounding isn't wanted.

## My `absolute`-positioned element jumped to a completely different spot than expected — is this a bug?

Not a bug — `position: absolute` positions relative to the nearest ancestor with a non-static `position` (`relative`, `absolute`, `fixed`, or `sticky`); if no such ancestor exists anywhere up the tree, it falls all the way back to the page's initial containing block, which is almost never the intended reference point. The fix is deliberately setting `position: relative` on whichever ancestor was actually meant to be the reference point — once that's in place, the absolutely-positioned child anchors exactly where expected.

## Is `!important` always bad practice?

Not always, but it should be rare and deliberate, not habitual. A single, well-documented `!important` overriding an inline style from a third-party widget you don't control is a legitimate, narrow use. A codebase that's accumulated dozens of `!important` declarations over time — some now overriding each other — is a real maintainability problem, and it's usually a sign that `@layer` (which resolves the same kind of conflict through explicit layer ordering instead) should have been reached for instead, especially for anything involving component-library overrides.
