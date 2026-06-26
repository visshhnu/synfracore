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

## Quick Reference — Tekton

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
