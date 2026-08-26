# Backstage Troubleshooting Guide

## Issue 1: A registered entity doesn't appear in the catalog, or shows a processing error

**Symptom:** After registering (manually or via discovery), an entity is missing from the catalog UI, or shows an error/warning icon.

**Root Cause:** Commonly a malformed `catalog-info.yaml` (invalid YAML syntax, a missing required field like `spec.type`), or a reference to another entity that doesn't itself exist (e.g. `providesApis` referencing an API entity that was never registered).

**Debug steps:**
```bash
# Check the entity's processing status/errors directly via the
# catalog API
curl -u <token>: "https://backstage.example.com/api/catalog/entities/by-name/component/default/my-service"
# Look for a "status" field with processing errors specifically

# Validate the YAML file's basic syntax independently
yamllint catalog-info.yaml
```

**Fix:** Correct the specific validation error reported (malformed YAML, missing required field, or a dangling reference to an unregistered entity) — Backstage's own catalog processing errors are usually specific enough to point directly at the actual problem, worth reading carefully rather than guessing.

---

## Issue 2: Discovery isn't picking up a new service's catalog-info.yaml

**Symptom:** A new service with a valid `catalog-info.yaml` in its repository doesn't appear in the catalog, despite discovery being configured.

**Root Cause:** Commonly the file isn't at the exact path the discovery configuration expects (`catalogPath` mismatch), the repository doesn't match the discovery provider's configured scope (wrong org, or an exclusion pattern), or discovery simply hasn't run its next scheduled cycle yet.

**Debug steps:**
```yaml
# Confirm the configured catalogPath actually matches where the
# file lives in the repo
catalog:
  providers:
    github:
      myOrg:
        catalogPath: '/catalog-info.yaml'   # must match exactly
```

**Fix:** Correct the `catalogPath` if it doesn't match the file's actual location, confirm the repository is within the discovery provider's configured scope, or manually trigger/wait for the next scheduled discovery cycle if the configuration is actually correct and it's simply a timing issue.

---

## Issue 3: A Software Template fails partway through execution

**Symptom:** Running a Scaffolder template fails at a specific step (e.g. the `publish:github` step) after earlier steps succeeded.

**Root Cause:** Commonly a credentials/permissions issue with the specific integration that step depends on (a GitHub token lacking repo-creation permission), or a naming conflict (attempting to create a repository name that already exists).

**Debug steps:**
```bash
# Scaffolder task execution logs show exactly which step failed
# and the specific error from that step's action
# (visible in the Backstage UI's task execution view, or via the
# Scaffolder API)
```

**Fix:** Address the SPECIFIC failing step's actual error — a credentials issue requires fixing the integration's token/permissions; a naming conflict requires either a different name or handling the conflict explicitly in the template's parameter validation (e.g. checking name availability before attempting to publish).

---

## Issue 4: TechDocs shows a build error or doesn't render for a service

**Symptom:** A service's TechDocs tab shows an error instead of rendered documentation.

**Root Cause:** Commonly invalid MkDocs configuration (`mkdocs.yml` syntax error), a Markdown file referencing an image/asset that doesn't exist at the expected path, or the `backstage.io/techdocs-ref` annotation pointing to the wrong location.

**Debug steps:**
```bash
# Test the MkDocs build locally, independent of Backstage, to
# isolate whether this is a documentation content problem or a
# Backstage integration problem
mkdocs build --strict
```

**Fix:** If the local MkDocs build itself fails, fix the underlying documentation content/config issue directly (the `--strict` flag surfaces exactly what's wrong). If the local build succeeds but Backstage still fails to render it, check the `techdocs-ref` annotation and TechDocs backend configuration instead, since the problem is then in the Backstage integration layer, not the documentation content itself.

---

## Issue 5: A previously-working custom plugin breaks after a Backstage core upgrade

**Symptom:** A custom plugin that worked fine stops functioning correctly after upgrading Backstage's core packages.

**Root Cause:** Backstage's plugin APIs (particularly around the backend system) have evolved over versions — a plugin built against an older API pattern (e.g. the legacy backend system) may need updates to work correctly against a newer core version, especially across a major version boundary like the transition to the new backend system.

**Debug steps:**
```bash
# Check Backstage's own upgrade/migration notes for the specific
# version range being crossed -- breaking changes are generally
# documented, particularly for major architectural shifts
```

**Fix:** Review the specific breaking changes documented for the crossed version range and update the custom plugin's code accordingly — this is generally NOT a bug in Backstage itself, but an expected consequence of a plugin needing to track core API evolution, which is worth budgeting real maintenance time for when operating custom plugins long-term, not treating as a one-time setup cost.
