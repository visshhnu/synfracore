# Jenkins — Fundamentals

## Controller and agents — why isolation matters

Jenkins runs as a **controller** (formerly called "master") that schedules jobs and serves the UI, plus a fleet of **agents** that actually execute build steps. The controller should never run build jobs directly — a build that hangs, consumes excessive memory, or has a malicious dependency can take down the controller itself if it runs there, affecting every other job on the entire Jenkins instance, not just the one build. Agent isolation exists specifically to contain this blast radius.

## Declarative Pipeline: the modern way to define a Jenkinsfile

```groovy
pipeline {
    agent any
    environment {
        REGISTRY = "myregistry.io"
    }
    stages {
        stage('Build') {
            steps { sh 'docker build -t myapp:${BUILD_NUMBER} .' }
        }
        stage('Test') {
            steps { sh 'npm test' }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps { sh 'kubectl apply -f k8s/' }
        }
    }
    post {
        always { junit 'test-results/*.xml' }
        failure { slackSend message: "Build failed: ${env.BUILD_URL}" }
    }
}
```

**Always store the Jenkinsfile in source control alongside the code it builds** ("Pipeline as Code") — this gets pipeline changes reviewed via the same pull-request process as application code, and means the pipeline definition for any given commit is exactly reproducible, rather than living disconnected in a UI-configured job that doesn't track with the code's history.

## The `post` block: cleanup and notification that always runs

`post` conditions (`always`, `success`, `failure`, `unstable`) run regardless of which stage the pipeline reached or failed at — this is the correct place for cleanup (removing temp files, tearing down test containers) and notifications, since it's guaranteed to execute even when an earlier stage fails partway through, unlike code placed inside a specific stage that a failure elsewhere would skip entirely.

## Credentials: never in the Jenkinsfile itself

```groovy
environment {
    DOCKER_CREDS = credentials('docker-hub-creds')
}
steps {
    sh 'echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin'
}
```

Credentials are configured once in Jenkins' own Credentials Store (or an external secrets manager it's integrated with), referenced by ID in the Jenkinsfile — never as literal values. This keeps secrets out of source control entirely while still letting the pipeline definition itself be fully public/reviewable.

## Parallel stages: real time savings for independent work

```groovy
stage('Test') {
    parallel {
        stage('Unit Tests') { steps { sh 'npm run test:unit' } }
        stage('Lint') { steps { sh 'npm run lint' } }
        stage('Security Scan') { steps { sh 'trivy fs .' } }
    }
}
```
Independent stages (unit tests, linting, a security scan) don't need to run sequentially — parallelizing them cuts real pipeline wall-clock time proportionally to how much of the work was genuinely independent, which for a typical test/lint/scan combination is usually most of it.

## Plugins: powerful, but a real upgrade-complexity cost

Jenkins' plugin ecosystem is what makes it extensible to almost any tool or workflow — but every installed plugin is also a dependency that can break on a Jenkins core upgrade, or have its own security vulnerabilities needing separate patching. A minimal, deliberately-chosen plugin set is a real operational advantage over installing everything that looks potentially useful; plugin sprawl is a common, genuine source of fragile, hard-to-upgrade Jenkins instances in practice.
