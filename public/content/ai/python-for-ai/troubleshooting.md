# Python Foundations for AI — Troubleshooting

## `401 Unauthorized` or `AuthenticationError`

Your API key is missing, wrong, or expired. Check first: is `ANTHROPIC_API_KEY` (or your provider's equivalent) actually set in the environment your code is running in — a common trap is having it set in one terminal session but running your code from an IDE that doesn't inherit that shell's environment variables. Second most common: a key that was regenerated/revoked, with the old value still cached in a `.env` file that never got updated.

## `429 Too Many Requests` / rate limit errors

You're exceeding the API's rate limit — either requests-per-minute or tokens-per-minute, check which one the error message specifies, since the fix differs. For requests-per-minute limits, the exponential-backoff retry pattern (see Fundamentals) is the right fix. For tokens-per-minute limits on a single very large request, backoff alone won't help — you need to actually reduce request size (shorter context, lower `max_tokens`) or spread large batch jobs out over time deliberately rather than firing them all at once.

## `KeyError` when parsing an API response

The response didn't have the shape you expected — usually because you're accessing a success-response field on what's actually an error response, or a field that's conditionally present (see Interview Q&A's note on this). Print the full raw response object before accessing any specific field, the first time you're debugging this — don't guess at the shape from memory or from a tutorial's example, since API response shapes do get updated between SDK versions.

## Your streamed response prints garbled or out of order

Almost always a print-buffering issue, not an actual data-ordering problem — Python's `print()` buffers output by default in some contexts (especially when piped or redirected), so chunks that arrived in the correct order can appear to render out of order. Add `flush=True` to your print calls in a streaming loop (`print(chunk, end="", flush=True)`) before assuming the API itself is sending data out of order.

## `asyncio` code hangs or never completes

Most commonly: forgetting to `await` a coroutine (calling an async function without `await` just creates a coroutine object that never actually runs), or mixing sync and async code incorrectly (calling a blocking synchronous function from inside an async function, which blocks the entire event loop instead of yielding control). If your async code "hangs," first check every async function call in the hanging path actually has `await` in front of it.

## Cosine similarity function returns `nan`

Almost always a zero vector — dividing by `np.linalg.norm(vec)` when `vec` is all zeros divides by zero, producing `nan`. This happens in practice when an embedding call failed silently and returned a zero-filled placeholder instead of raising an error, or when a document was empty and produced a degenerate embedding. Check for zero-norm vectors before the division, and — more importantly — check why an embedding came back as all-zeros in the first place, since that's usually a symptom of an earlier silent failure, not a math bug.

## Your evaluation score looks suspiciously perfect or suspiciously terrible

A 100% eval score usually means your `expected_check` function is too lenient (matching almost anything as "correct") rather than your prompt being flawless — inspect a few individual eval cases manually rather than trusting the aggregate number. A 0% score often means the check function itself has a bug (checking for the wrong field name, an off-by-one in string matching) rather than every single response actually being wrong — verify the check logic against one manually-confirmed-correct response before concluding the prompt is the problem.
