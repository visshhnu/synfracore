# Jenkins — Shared Libraries & Kubernetes Agents

## Shared Libraries: the fix for 50 near-identical Jenkinsfiles

Without a shared library, every team writing its own `docker build`/`push`/`deploy` steps directly in each service's Jenkinsfile produces real, compounding duplication — a change to the standard build process (adding a security scan step, say) means editing every single Jenkinsfile individually. A Shared Library centralizes this common logic in one Git repository:

```
jenkins-shared-library/
├── vars/
│   ├── dockerBuild.groovy      # global function pipelines call directly
│   └── deployToK8s.groovy
└── src/                          # Groovy classes for more complex logic
```

```groovy
// vars/dockerBuild.groovy
def call(String image, String tag) {
    sh "docker build -t ${image}:${tag} ."
    sh "docker push ${image}:${tag}"
}
```

```groovy
// each service's Jenkinsfile becomes thin orchestration
@Library('jenkins-shared-library@v2.1.0') _
pipeline {
    stages {
        stage('Build') { steps { dockerBuild('myapp', env.BUILD_NUMBER) } }
    }
}
```

**Pin the library to a tagged version** (`@v2.1.0`), not a branch — an unpinned shared library reference means every pipeline using it can change behavior the moment someone pushes to the library's default branch, which is exactly the kind of surprising, hard-to-trace change you don't want in a shared build dependency. Configure the library once in Jenkins → Manage Jenkins → Global Pipeline Libraries.

## Kubernetes agents: ephemeral, isolated build environments

The Jenkins Kubernetes plugin provisions a fresh pod for each build, rather than running builds on static, long-lived agent machines:

```groovy
pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: maven
    image: maven:3.9-eclipse-temurin-21
    command: ['cat']
    tty: true
"""
        }
    }
    stages {
        stage('Build') {
            steps { container('maven') { sh 'mvn clean package' } }
        }
    }
}
```

Real benefits over static agents: no idle cost (a pod exists only for the build's duration), a clean environment on every single build (no state leaking between builds on a shared static agent), horizontal scalability (Kubernetes can schedule many agent pods in parallel, up to cluster capacity), and per-job container images (a Maven job gets a Maven image, a Node job gets a Node image, without needing every possible tool pre-installed on one shared agent). The real cost: pod startup time (commonly 10-30 seconds) adds to every build's total time — mitigated with pre-warmed pod templates or accepted as a reasonable tradeoff for the isolation and scaling benefits.

## Jenkins HA and Configuration as Code

Production Jenkins at real scale needs both reliability and reproducibility: an active/standby controller setup (or a Kubernetes-native Jenkins Operator) for high availability, and **Configuration as Code (CasC)** — defining Jenkins' own system configuration (not pipelines, the Jenkins instance itself: plugins, security settings, credentials providers) in a versioned YAML file rather than through manual UI clicks:

```yaml
# jenkins-casc.yaml
jenkins:
  numExecutors: 0   # controller runs zero builds itself, per the isolation principle above
  securityRealm:
    ldap: { server: "ldap://corp.example.com" }
```

Without CasC, reproducing a Jenkins instance's exact configuration after a disaster (or replicating it for a second team) means manually re-clicking through the same UI settings from memory — CasC makes the entire instance configuration reviewable, versioned, and reproducible the same way Pipeline as Code does for individual jobs.

## Credential rotation and Vault integration

Storing credentials directly in Jenkins' built-in Credentials Store works, but doesn't provide automatic rotation — a leaked credential stays valid until someone manually revokes it. Integrating with HashiCorp Vault (or a cloud provider's secrets manager) lets Jenkins fetch short-lived, auto-rotating credentials at build time instead of static, long-lived ones stored permanently in Jenkins itself — meaningfully reducing the blast radius of a credential leak, since a leaked short-lived token expires on its own.
