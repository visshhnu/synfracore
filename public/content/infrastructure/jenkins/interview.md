# Jenkins — Interview Questions

**What is the difference between Declarative and Scripted pipelines?**
Declarative pipeline uses a structured, opinionated syntax with predefined sections (pipeline, agent, stages, steps) — easier to read, write, and validate, with built-in error handling and post conditions. Scripted pipeline is pure Groovy — maximum flexibility and power but more complex, no built-in validation, harder to maintain. For new pipelines: always use Declarative. Use Scripted only when Declarative's syntax can't express what you need (rare — Declarative covers 95% of use cases). You can embed Scripted blocks in Declarative using the `script {}` step.

**How do you implement a parallel pipeline in Jenkins?**
Use the `parallel` directive inside a stage. Each key is a branch name, value is the steps to run. All branches run concurrently on available agents.
```groovy
stage('Test') {
    parallel {
        'Unit Tests': { sh 'npm run test:unit' }
        'Integration Tests': { sh 'npm run test:integration' }
        'Lint': { sh 'npm run lint' }
    }
}
```
Critical: shared workspace causes conflicts in parallel stages — give each branch its own agent or workspace. `failFast: true` option aborts all parallel branches if one fails.

**What are Jenkins Shared Libraries and why use them?**
Shared Libraries store reusable Groovy code that multiple Jenkinsfiles can import — DRY principle for pipelines. Define functions in `vars/` directory, complex classes in `src/`. Version-controlled in their own Git repo. Benefits: standardize deployment steps across 50 microservices without duplication, ensure security/compliance steps run in every pipeline, update build logic in one place. Reference with `@Library('my-lib') _` at top of Jenkinsfile, then call `myFunction(args)`. Configure the library location in Jenkins → Manage Jenkins → System → Global Pipeline Libraries.

**How do you handle credentials securely in Jenkins?**
Store credentials in Jenkins Credential Store (never hardcode). Types: Secret Text, Username/Password, SSH Private Key, Certificate, Secret File. Access in pipelines via `withCredentials` block — variables are masked in console output. For cloud providers, prefer IAM roles (Jenkins agents running on EC2/EKS with instance profiles) over stored access keys — no rotation needed, no credential leakage. For Kubernetes, use pod templates with service accounts. Audit credentials usage with the "Credentials Binding" plugin and regularly rotate stored secrets.

**What is Jenkins Blue Ocean?**
Blue Ocean is a modern UI redesign for Jenkins that provides a visual pipeline editor, improved pipeline visualization showing parallel stages clearly, personalized dashboard showing pipelines relevant to the user, and better integration with GitHub/Bitbucket. It's particularly good for showing the pipeline as a visual flowchart with pass/fail status per stage. It's installed as a plugin. For new teams: Blue Ocean makes Jenkins less intimidating. For power users: the classic UI often has more options exposed.
