# HTML — Real World Scenarios

A note on framing: all 3 scenarios below are illustrative/composite — common, well-documented patterns from real front-end development industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The div-based button that quietly locked out keyboard users for months

**The pattern:** A design team ships a visually polished "Add to Cart" control built as a styled `<div>` with an `onclick` handler, because it needed a specific visual treatment a designer felt a native `<button>` couldn't achieve as easily. It looks and works perfectly to every sighted mouse user during QA and for months afterward. An internal accessibility audit — prompted by an unrelated compliance requirement, not a user complaint — eventually reveals that the control is completely unreachable by keyboard: it's not in the tab order, Enter/Space do nothing, and a screen reader announces it as plain, non-interactive text.

**Why this is a genuinely easy trap, not an obvious mistake:** the control visually and functionally "worked" for the overwhelming majority of testers and users (anyone using a mouse), and nothing in a standard visual QA pass would ever surface a keyboard-only or screen-reader-only failure — it requires someone to specifically test that way, which most teams don't do by default. A `<div>` with `onclick` produces zero errors or warnings in the browser console; the failure is entirely silent unless deliberately tested for.

**What actually prevents this:**
- **Default to real interactive elements (`button`, `a`) for anything clickable, and treat a styled `div` with `onclick` as requiring explicit justification**, not the default starting point — nearly any visual treatment achievable on a `div` is also achievable on a real `button` with CSS.
- **Include keyboard-only navigation as a standard QA step**, not an occasional audit — unplug the mouse and confirm every interactive element is reachable and operable via Tab and Enter/Space, on every significant UI change, not just during periodic compliance reviews.
- **Run an automated accessibility check (Lighthouse or equivalent) in CI**, so a genuinely non-interactive-looking interactive element gets flagged automatically before merge, rather than surfacing only during an infrequent manual audit.

---

## Scenario 2 (illustrative/composite): The missing viewport meta tag that made a redesign look broken on real phones

**The pattern:** A team ships a fully responsive CSS redesign, tested thoroughly using desktop browser DevTools' device-emulation mode, and the layout adapts correctly at every breakpoint in that testing. On launch, real mobile users report the site looking like a tiny, zoomed-out desktop page — none of the responsive breakpoints appear to be taking effect at all. The team initially suspects a CSS media query bug and spends real time auditing breakpoint values before discovering the actual cause: the `<meta name="viewport">` tag was accidentally removed during an unrelated `<head>` cleanup weeks earlier, and DevTools' device emulation mode doesn't actually require it to simulate a mobile viewport width — masking the bug in every test that was actually run.

**Why this is an easy, non-obvious side effect of an unrelated change:** DevTools' responsive design mode is genuinely good at reproducing most real mobile rendering behavior, which is exactly why the team trusted it — but its viewport simulation doesn't depend on the page's own viewport meta tag the same way a real device's browser does, so a missing tag is one of the few classes of bug that passes DevTools testing cleanly while failing on real hardware. The change that removed it was made for an unrelated reason (head cleanup), with no connection drawn to responsive layout at the time.

**What actually addresses this:**
- **Test on at least one real physical device before every significant release**, not DevTools emulation alone — this is specifically the class of bug that emulation can miss.
- **Treat `<meta charset>` and `<meta name="viewport">` as protected, checklist-verified lines whenever `<head>` is touched for any reason**, since both are easy to remove accidentally during unrelated cleanup and both cause failures that are non-obvious until tested the right way.
- **Add an automated check (even a simple CI grep, or a Lighthouse mobile-friendliness check) that fails the build if the viewport meta tag is missing**, converting a silent, easy-to-reintroduce regression into an immediately visible one.

---

## Scenario 3 (illustrative/composite): The unsanitized user-generated content field that became a stored XSS vector

**The pattern:** A product review feature renders user-submitted review text using `innerHTML` (chosen originally so simple formatting like line breaks could be preserved), with no sanitization applied — reasoned, at the time, as low-risk since reviews go through a manual moderation queue before publishing. Months later, a security review (not a live incident, in this composite) flags that any review text containing a script tag or an event-handler-bearing attribute would execute in every visitor's browser the moment the review renders — moderators reviewing plain-looking review text in an admin panel had no reliable way to visually catch a payload disguised inside, say, an `<img src=x onerror=...>` tag that renders as a broken image icon rather than obviously malicious text.

**Why this is a common, easy-to-misdiagnose failure:** the vulnerability produces no error, no crash, and no visible symptom until specifically exploited — a page that "just works" for the overwhelming majority of genuine reviews gives no signal that unsanitized `innerHTML` is quietly a live injection point. Manual moderation feels like a reasonable safeguard on the surface, but it's a human process checking for *inappropriate content*, not systematically checking every submission for markup-level injection payloads, which is a fundamentally different and much narrower check than what's actually needed.

**What actually addresses this:**
- **Default to `textContent` for any untrusted string rendered into the DOM, treating `innerHTML` with untrusted input as requiring explicit, deliberate justification** — not a default choice made for formatting convenience.
- **If rich formatting from user input genuinely must be preserved, sanitize through a real, actively maintained library (DOMPurify or equivalent) before insertion**, never through manual moderation alone or a hand-rolled regex, both of which reliably miss edge cases.
- **Treat this as a structural, code-level control, not a process control** — moderation is a reasonable layer for genuinely inappropriate content, but it was never designed to be, and should never be relied on as, the actual defense against markup-level injection.
