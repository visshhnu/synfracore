# JavaScript — Real-World Scenarios

The scenarios below are illustrative/composite — assembled from common, well-documented JavaScript failure patterns, not a transcript of one specific incident.

## Scenario 1 (illustrative/composite): The Closure-in-a-Loop Bug

**The pattern:** A team builds a page rendering a list of buttons, each meant to alert its own index when clicked.

```javascript
for (var i = 0; i < 3; i++) {
  const btn = document.createElement("button");
  btn.textContent = `Button ${i}`;
  btn.addEventListener("click", () => alert(`You clicked button ${i}`));
  document.body.appendChild(btn);
}
```

Every button, when clicked, alerts `"You clicked button 3"` — regardless of which one was actually clicked.

**Why this is a trap:** `var` is function-scoped, not block-scoped — there is only ONE `i` shared across the entire loop, not a fresh one per iteration. By the time any button is actually clicked (well after the loop has finished running), `i` has already reached its final value, `3`. Every closure captured a reference to the *same* variable, not a snapshot of its value at the time the closure was created.

**What actually prevents this:**

- Use `let` instead of `var` in the loop — `let` creates a fresh binding of `i` for each iteration, so each closure captures its own separate copy.
- Alternatively, wrap the loop body in an IIFE (immediately-invoked function expression) that takes `i` as a parameter, creating a new scope per iteration manually — a legacy pattern from before `let` existed, worth recognizing but not preferring in new code.
- This bug is specifically why `let`/`const` were introduced for loop variables in ES6 — it was common enough to be a language design motivator, not a rare edge case.

---

## Scenario 2 (illustrative/composite): The Un-Removed Event Listener Memory Leak

**The pattern:** A single-page application repeatedly opens and closes a modal component. Each time it opens, it attaches a `resize` listener to `window` to reposition itself; the code that closes the modal removes it from the DOM, but never removes the listener.

```javascript
function openModal(content) {
  const modal = document.createElement("div");
  modal.textContent = content;
  document.body.appendChild(modal);

  window.addEventListener("resize", () => repositionModal(modal));
  // closeModal() below removes `modal` from the DOM, but the listener above
  // still holds a reference to it -- and to whatever `content` closed over --
  // so neither can be garbage collected as long as the listener exists
}

function closeModal(modal) {
  modal.remove(); // removed from the DOM, but NOT from window's listener list
}
```

After a user opens and closes the modal 50 times over a long session, the page's memory usage climbs steadily and never comes back down, and resize handling gets progressively slower (every accumulated listener still fires on every resize event).

**Why this is a trap:** Removing an element from the DOM does not automatically clean up event listeners referencing it — `window.addEventListener` keeps its own independent reference to both the callback function and anything that callback closes over (`modal`, `content`), regardless of whether that element is still visible or even still in the document.

**What actually prevents this:**

- Always pair `addEventListener` with a matching `removeEventListener`, called at the exact point the thing it's attached to goes away — store the handler function in a variable so it can be referenced again to remove it (an inline arrow function passed directly to `addEventListener` can't be removed later, since there's no reference to it).
- In component-based frameworks, this maps directly to a cleanup/unmount lifecycle hook — the underlying JavaScript mechanism is identical either way.
- Use browser DevTools' Memory tab (heap snapshot comparison, before/after repeated open/close cycles) to actually confirm a suspected leak rather than guessing — retained size that keeps climbing across snapshots is the concrete signal.

---

## Scenario 3 (illustrative/composite): The Race Condition From Unawaited Async Calls

**The pattern:** A live search box fires an API request on every keystroke, rendering whatever response arrives.

```javascript
searchInput.addEventListener("input", async (e) => {
  const query = e.target.value;
  const res = await fetch(`/api/search?q=${query}`);
  const results = await res.json();
  renderResults(results); // renders whatever comes back, whenever it comes back
});
```

A user types "cat", pauses briefly, then quickly changes it to "dog". Occasionally, the results shown are for "cat" — the *older* search — even though "dog" was typed more recently.

**Why this is a trap:** Each keystroke fires its own independent `fetch`, and nothing guarantees the responses arrive in the same order the requests were sent — a slower network response for an earlier query can resolve *after* a faster response for a later one, and the code renders whatever response shows up last, with no awareness of which query it actually corresponds to.

**What actually prevents this:**

- Track a request ID (or timestamp) per call, and only render a response if it matches the most recent request ID at the time it resolves — discard anything else as stale.
- Use `AbortController` to cancel the previous in-flight request outright as soon as a new one starts, so a stale response never has the chance to arrive and get rendered at all.
- Debounce the input itself (see Advanced) so a request isn't even fired on every single keystroke — this reduces how often the race condition can occur, though it doesn't eliminate the underlying ordering problem on its own and is usually combined with one of the two fixes above, not used as a substitute for them.
