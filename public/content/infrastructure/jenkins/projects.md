# Jenkins -- Portfolio Projects

---

## Project 1: Node.js CI with Coverage Gate

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `jenkins-nodejs-pipeline`

Pipeline that enforces 80% code coverage -- fails the build if coverage drops below threshold.

```groovy
pipeline {
    agent { docker { image "node:20-alpine" } }
    environment {
        DOCKER_CREDS = credentials("dockerhub-creds")
        IMAGE        = "yourdockerhub/nodeapp"
        COVERAGE_MIN = 80
    }
    stages {
        stage("Install") { steps { sh "npm ci" } }
        stage("Lint")    { steps { sh "npm run lint" } }
        stage("Test + Coverage") {
            steps { sh "npm test -- --coverage" }
        }
        stage("Coverage Gate") {
            steps {
                script {
                    def cov = sh(script: "cat coverage/coverage-summary.json | python3 -c \"import sys,json; print(json.load(sys.stdin)[\'total\'][\'lines\'][\'pct\'])\"",
                                 returnStdout: true).trim().toFloat()
                    if (cov < env.COVERAGE_MIN.toFloat()) {
                        error "Coverage ${cov}% below ${env.COVERAGE_MIN}%"
                    }
                }
            }
        }
        stage("Build & Push") {
            when { branch "main" }
            steps {
                script {
                    docker.withRegistry("", "dockerhub-creds") {
                        docker.build("${IMAGE}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }
    }
    post {
        failure { slackSend channel: "#ci", color: "danger", message: "FAILED: ${JOB_NAME}" }
    }
}
```

**Steps:** Jenkins via Docker, webhooks, Blue Ocean, intentionally break coverage to test gate

---

## Project 2: Multi-Environment Deployment with Approvals

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `jenkins-multienvironment-deploy`

Build once, deploy to dev automatically, then staged approvals for staging and production.

```groovy
stage("Approve Staging") {
    steps {
        input message: "Deploy ${BUILD_NUMBER} to Staging?",
              ok: "Deploy",
              submitter: "senior-devops,team-lead"
    }
}
stage("Deploy Staging") {
    steps {
        sh "kubectl set image deployment/myapp myapp=myrepo/myapp:${BUILD_NUMBER} -n staging"
    }
}
stage("Approve Production") {
    steps {
        input message: "Deploy to PRODUCTION?",
              ok: "YES - Deploy",
              submitter: "engineering-manager"
    }
}
```

**Steps:** 3 K8s namespaces, approval gates, rollback parameter, MTTR tracking

---

## Portfolio Checklist
- [ ] Jenkinsfiles in the same Git repo as the application
- [ ] No credentials in Jenkinsfile -- use Jenkins Credential Store
- [ ] Pipeline fails fast (lint before test, test before build)
- [ ] Blue Ocean UI configured
