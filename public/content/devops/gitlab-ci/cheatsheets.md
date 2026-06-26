# GitLab CI Cheatsheet

```yaml
stages: [build, test, deploy]

variables:
  IMAGE: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA

.deploy-template:
  before_script:
    - kubectl config use-context $KUBE_CONTEXT

build:
  stage: build
  image: docker:26
  services: [docker:26-dind]
  script:
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
    - docker build -t $IMAGE .
    - docker push $IMAGE
  only: [main]

test:
  stage: test
  image: node:20
  script: [npm ci, npm test]
  coverage: '/Coverage: \d+\.\d+%/'
  artifacts:
    reports:
      coverage_report:
        coverage_format: cobertura
        path: coverage/cobertura-coverage.xml

deploy-production:
  stage: deploy
  extends: .deploy-template
  script:
    - helm upgrade --install myapp ./chart --set image.tag=$CI_COMMIT_SHA
  environment: { name: production, url: https://app.example.com }
  when: manual
  only: [main]
```

## Quick Reference — Gitlab Ci

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
