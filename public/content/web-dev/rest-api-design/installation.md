# REST API Design — Tooling

There's nothing to install for this technology — REST API Design is a set of principles, not a runtime, library, or CLI. Being upfront about that rather than manufacturing an "installation" step that doesn't actually apply here. What follows instead is the practical tooling real teams use while designing and testing APIs.

## An API client for testing requests

You need something that can send an arbitrary HTTP request (any method, custom headers, a JSON body) and show you the raw response, including status code and headers — not just a browser address bar, which only sends GET.

**`curl`** — available everywhere, scriptable, and what most of this course's own examples use:

```bash
# GET
curl -i https://api.example.com/users/42

# POST with a JSON body
curl -i -X POST https://api.example.com/users \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice", "email": "alice@example.com"}'

# PATCH with an auth header
curl -i -X PATCH https://api.example.com/users/42 \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{"name": "Alice Smith"}'

# -i prints response headers + status line, not just the body -- this
# matters a lot for this course specifically, since status codes and
# headers are half of what you're designing
```

**GUI alternatives** — Postman, Insomnia, or Thunder Client (a VS Code extension) — give you a saved-request history, environment variables, and a friendlier view of headers/status codes than raw `curl` output. Any of these is fine; pick whichever fits your workflow. None is required over the others for this course.

## API specification / documentation formats

Once an API's design is settled, real teams document its contract in a machine-readable spec, most commonly **OpenAPI** (formerly known as Swagger) *(needs verification — recheck against current source; the spec version and tooling ecosystem around it evolve)*. An OpenAPI document describes every endpoint, method, expected request/response shape, and status code in one YAML/JSON file — tools can then generate interactive docs, client SDKs, or even mock servers directly from it.

You don't need to write OpenAPI to work through this course — it's mentioned here because it's the standard your future team will likely already use, and recognizing `openapi.yaml`/`swagger.json` in a real codebase is worth knowing on sight.

## Next Steps

No install step to verify — go straight to **Fundamentals** and start designing.
