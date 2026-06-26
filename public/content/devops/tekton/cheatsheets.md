# Tekton Cheatsheet

```yaml
# Task
apiVersion: tekton.dev/v1
kind: Task
metadata:
  name: build-push
spec:
  workspaces:
    - name: source
  steps:
    - name: build
      image: gcr.io/kaniko-project/executor
      args:
        - --context=dir://$(workspaces.source.path)
        - --destination=registry.example.com/myapp:$(params.IMAGE_TAG)

# Pipeline
apiVersion: tekton.dev/v1
kind: Pipeline
spec:
  workspaces:
    - name: shared-workspace
  tasks:
    - name: fetch-source
      taskRef: { name: git-clone }
    - name: build
      taskRef: { name: build-push }
      runAfter: [fetch-source]
      workspaces:
        - name: source
          workspace: shared-workspace
```
