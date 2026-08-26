# Backstage Intermediate — Software Templates, TechDocs & Search

## Software Templates in Depth

```yaml
apiVersion: scaffolder.backstage.io/v1beta3
kind: Template
metadata:
  name: new-microservice
  title: New Microservice
  description: Scaffolds a new microservice following our golden path
spec:
  owner: platform-team
  type: service
  parameters:
    - title: Service Details
      required: [name, owner]
      properties:
        name: { type: string, title: Service Name, pattern: '^[a-z0-9-]+$' }
        owner: { type: string, title: Owning Team }
        description: { type: string, title: Description }
  steps:
    - id: fetch
      name: Fetch Skeleton
      action: fetch:template
      input:
        url: ./skeleton
        values:
          name: '${{ parameters.name }}'
          owner: '${{ parameters.owner }}'
    - id: publish
      name: Publish to GitHub
      action: publish:github
      input:
        repoUrl: 'github.com?owner=my-org&repo=${{ parameters.name }}'
        defaultBranch: main
    - id: register
      name: Register in Catalog
      action: catalog:register
      input:
        repoContentsUrl: '${{ steps.publish.output.repoContentsUrl }}'
        catalogInfoPath: /catalog-info.yaml

  output:
    links:
      - title: Repository
        url: '${{ steps.publish.output.remoteUrl }}'
```

A Template's `steps` are a sequence of Scaffolder ACTIONS — `fetch:template` pulls a skeleton directory and substitutes in parameter values (Jinja-style templating within the skeleton's files), `publish:github` creates the actual repository, `catalog:register` automatically registers the new project as a catalog entity — meaning a scaffolded project is immediately visible in the catalog without a separate manual registration step.

## The "Golden Path" Philosophy

```
A golden path is the DEFAULT, well-supported way to accomplish a
common task (create a new service, add a new API endpoint) --
not the ONLY way, but the path an organization has invested in
making genuinely easy and correct by default.
```

Software Templates operationalize golden paths — instead of a golden path being a wiki page someone might not read, or might read and still get slightly wrong copying manually, the Scaffolder makes following the golden path the PATH OF LEAST RESISTANCE — genuinely easier than doing it manually and getting some detail wrong, which is what actually drives real adoption of a standard, more than documentation alone typically does.

## TechDocs — Documentation as Code

```
docs/
  index.md
  architecture.md
mkdocs.yml
```

Linking it to the catalog entity:

```yaml
# catalog-info.yaml -- linking TechDocs to a catalog entity
metadata:
  annotations:
    backstage.io/techdocs-ref: dir:.
```

TechDocs uses MkDocs (a static site generator for Markdown) under the hood — documentation is written as Markdown files living in the SAME repository as the code, versioned and reviewed via the same pull-request process as code changes, then built and rendered directly within the Backstage portal alongside that service's catalog entry. This directly addresses the classic "the wiki page is 2 years out of date" problem — docs living next to code, changed in the same PRs, are far more likely to actually stay current than documentation living in a separate system nobody's reminded to update.

## Search

```
Backstage's Search plugin indexes across MULTIPLE sources
simultaneously -- the Software Catalog itself, TechDocs content,
and any additional indexed source a plugin registers (e.g. a
wiki integration, if configured) -- surfaced through one unified
search experience in the portal.
```

Search's real value is exactly this consolidation — instead of a developer needing to know WHICH separate system might have the answer (is this in the wiki? the catalog? a README somewhere?) and searching each individually, one search box covers everything Backstage has indexed, reducing the "I don't know where to even start looking" friction that's common in organizations with knowledge scattered across many separate systems.

## Frontend and Backend Plugins

```
Frontend plugin  — adds UI: a new page, a card on an entity's
                    page, a sidebar item
Backend plugin   — adds server-side capability: a new API endpoint,
                    a catalog processor, a scheduled job
```

Most real Backstage plugins pair a frontend and backend component together — a frontend plugin showing CI/CD pipeline status on a service's catalog page, backed by a backend plugin that actually fetches that status from the CI system's API. Understanding this split matters when evaluating or building a plugin: a purely frontend plugin can only display data it can fetch client-side; anything requiring server-side credentials, aggregation, or scheduled work needs a backend component too.

## Try It (2 Minutes)

Using the golden path section above:

1. Why does making a golden path genuinely EASIER (via a Software Template) tend to drive more real adoption than documenting it well in a wiki?
2. Why does TechDocs living in the same repository as the code it documents help address documentation staying current?
3. What's the difference between what a frontend plugin and a backend plugin can each actually do?

You should land on: because the path of least resistance is what people actually follow under normal time pressure — a well-documented-but-manual process still requires someone to read carefully and execute every step correctly, while a Template makes the correct path also the EASIEST path; because docs changed in the same PRs as the code they describe are far more likely to be updated alongside real changes, unlike a separate wiki nobody's specifically reminded to touch when code changes; a frontend plugin can only display/interact with data reachable client-side; a backend plugin can hold server-side credentials, aggregate data, run scheduled jobs, and expose new APIs — genuinely different capabilities, which is why most substantial plugins pair both.
