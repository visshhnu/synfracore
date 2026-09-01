# HTML — FAQ

## Is HTML a programming language?

No, and this is worth being precise about — HTML is a *markup language*. It has no variables, no loops, no conditional logic, and can't perform computation; it describes the structure and meaning of content, not a sequence of instructions to execute. JavaScript is the programming language on the web; HTML and JavaScript solve genuinely different problems, and conflating them leads to real confusion about what each one is actually for.

## Do I need to learn HTML before CSS and JavaScript, or can I learn them together?

Learning HTML's structural fundamentals first — even briefly — pays off, because CSS and JavaScript both operate *on* HTML structure: CSS selects and styles elements, JavaScript reads and mutates the DOM that HTML produces. Trying to learn all three simultaneously from zero is possible but harder to debug, since it's difficult to tell whether a bug is structural (HTML), visual (CSS), or behavioral (JavaScript) without a baseline understanding of what correct HTML looks like on its own first.

## Is `<div>` bad practice? Should I avoid it entirely?

No — `<div>` and `<span>` are correct, necessary choices when there's genuinely no semantic element that fits, typically for pure CSS/JavaScript hooking with no inherent meaning of its own (a wrapper for a CSS grid layout, for instance). The actual problem is reaching for `<div>` by default *before* checking whether a semantic element (`nav`, `article`, `button`) already fits the role of the content — that habit is what "div-soup" refers to, not the mere existence of `<div>` in a page.

## Why do frameworks like React still matter if HTML is the real foundation?

Frameworks don't replace HTML — they generate it, dynamically, based on application state. A React component ultimately renders down to real HTML elements (`<div>`, `<button>`, `<input>`) that the browser receives and builds a DOM from, exactly the same as a hand-written page. Understanding HTML well is what lets a developer write framework code that produces genuinely semantic, accessible output rather than markup that looks fine visually but is a pile of meaningless, inaccessible `<div>`s underneath — the framework doesn't protect against that on its own.

## Does `alt` text actually matter for SEO, or is that outdated advice?

It still matters, but not primarily as a "keyword stuffing" trick the way some outdated SEO advice frames it — search engines use `alt` text to understand what an image depicts (since they can't natively interpret pixel content in most cases), and it's a genuine, documented accessibility requirement for screen reader users independent of any SEO benefit at all. Writing a good, honest, descriptive `alt` serves both purposes at once; writing keyword-stuffed `alt` text serves neither well and is easy for both search engines and screen readers to recognize as low-quality.

## Is ARIA required to make a page accessible?

Not by default, and this is a common overcorrection — the WAI-ARIA specification's own first rule states that no ARIA is better than bad ARIA. Native HTML elements (`button`, `nav`, `label`, `select`) already carry correct accessibility semantics automatically; ARIA exists specifically to fill genuine gaps where no native element provides the needed behavior (a custom widget with no native equivalent), not as something to sprinkle onto every element by default. A page built with correct native semantic HTML throughout often needs little to no additional ARIA at all.

## Why does my page look fine in Chrome but break in another browser?

Usually one of a few specific causes: a genuinely newer HTML/CSS feature not yet supported in the other browser (check actual current support before assuming it's universal), invalid/malformed HTML that different browsers' error-recovery parsers interpret differently (valid, well-formed HTML renders far more consistently across browsers), or a browser-specific default style difference. Running the page through the W3C Markup Validator is a genuinely useful first diagnostic step — a surprising number of cross-browser rendering bugs trace back to invalid markup that happens to "work" in one browser's more forgiving parser.

## Is it still worth learning plain HTML forms if most production apps use JavaScript-driven form libraries?

Yes — JavaScript form libraries still ultimately render real `<input>`, `<label>`, and `<form>` elements underneath, and understanding what correct, accessible native form markup looks like is exactly what lets a developer evaluate whether a given library's output is actually accessible or is quietly generating broken markup (unlabeled inputs, missing `name` attributes) that looks fine visually but fails real users. Native browser form validation (`required`, `type="email"`, `pattern`) also still works and still matters even inside a JavaScript-heavy form, often reducing how much custom validation logic needs to be written by hand at all.
