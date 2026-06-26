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
