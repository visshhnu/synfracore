# Jenkins Certification Guide

## Certifications Available

| Cert | Full Name | Questions | Time | Passing |
|------|-----------|-----------|------|---------|
| **CJE** | CloudBees Certified Jenkins Engineer | 60 | 90 min | 70% |
| **CJPE** | CloudBees Certified Jenkins Platform Engineer | 60 | 90 min | 70% |

CJE focuses on Jenkins core. CJPE adds CloudBees-specific features (team management, RBAC, plugins).

---

## CJE Exam Domains

| Domain | Topics |
|--------|--------|
| CI/CD & Jenkins Concepts | CI vs CD, Jenkins purpose, build triggers |
| Jenkins Administration | Install, config, system management |
| Building Continuous Delivery Pipelines | Declarative Pipeline, Blue Ocean |
| CD Patterns | Artifacts, deployment strategies, testing |
| Jenkins Plugins | Core plugins, manage plugins |

---

## Declarative Pipeline (Core of Exam)

```groovy
// Jenkinsfile — declarative syntax
pipeline {
    agent { label 'linux' }         // Run on nodes with 'linux' label

    environment {
        APP_VERSION = '1.0.0'
        DOCKER_REGISTRY = 'registry.example.com'
        DEPLOY_CREDS = credentials('deploy-ssh-key')  // Inject credentials
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()
    }

    triggers {
        pollSCM('H/5 * * * *')      // Poll SCM every 5 min
        cron('0 2 * * *')           // Nightly build at 2am
    }

    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Branch to build')
        booleanParam(name: 'DEPLOY', defaultValue: false, description: 'Deploy?')
        choice(name: 'ENV', choices: ['dev', 'staging', 'prod'], description: 'Target env')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/org/repo.git'
            }
        }

        stage('Build & Test') {
            parallel {                          // Run in parallel
                stage('Unit Tests') {
                    steps { sh 'npm test' }
                }
                stage('Lint') {
                    steps { sh 'npm run lint' }
                }
            }
        }

        stage('Build Image') {
            steps {
                sh "docker build -t ${DOCKER_REGISTRY}/myapp:${APP_VERSION} ."
                sh "docker push ${DOCKER_REGISTRY}/myapp:${APP_VERSION}"
            }
        }

        stage('Deploy') {
            when {
                expression { params.DEPLOY == true }
                branch 'main'
            }
            steps {
                sh "./deploy.sh ${params.ENV} ${APP_VERSION}"
            }
        }
    }

    post {
        always {
            junit 'test-results/**/*.xml'      // Archive test results
            cleanWs()                          // Clean workspace
        }
        success {
            slackSend message: "Build ${BUILD_NUMBER} succeeded"
        }
        failure {
            emailext to: 'team@example.com', subject: "Build Failed: ${JOB_NAME}"
        }
    }
}
```

---

## Key Jenkins Concepts

```
ARCHITECTURE:
  Controller: orchestrates builds, stores config
  Agent/Node: executes build steps (can be Docker, K8s pod, SSH)
  Executor: thread on agent that runs builds

TRIGGERS:
  SCM polling | Webhooks (preferred) | Cron | Upstream build

PLUGINS (know these for exam):
  Pipeline | Git | Docker Pipeline | Kubernetes | Blue Ocean
  Credentials | SonarQube | Nexus Artifact Uploader | Slack Notification
  JUnit | HTML Publisher | Email Extension

CREDENTIALS:
  Stored in Jenkins credentials store (encrypted)
  Types: username/password, SSH key, secret text, secret file, certificate
  Inject via: credentials() binding or withCredentials() block

SHARED LIBRARIES:
  Reusable Groovy code across pipelines
  @Library('my-shared-lib') import
  vars/ directory: global functions
  src/ directory: Groovy classes

MULTIBRANCH PIPELINE:
  Auto-discovers branches and PRs
  Each branch gets own pipeline (from Jenkinsfile)
  PR pipelines can validate before merge
```

---

## Study Resources

- **Jenkins Docs** (jenkins.io/doc) — free official documentation
- **CloudBees University** (university.cloudbees.com) — free tier available
- **"Jenkins: The Definitive Guide"** — free PDF available
- **Practice**: Run Jenkins locally with Docker: `docker run -p 8080:8080 jenkins/jenkins:lts`

## Revision Notes
```
CJE: 60 MCQ, 90 min, 70% pass, CloudBees proctored

MUST KNOW:
  Declarative Pipeline: agent/environment/options/triggers/parameters/stages/post
  Parallel stages: parallel { stage('A'){} stage('B'){} }
  When conditions: branch, expression, environment
  Post conditions: always/success/failure/unstable/changed

CREDENTIALS: never hardcode! Use credentials() or withCredentials()
SHARED LIBRARIES: @Library annotation, vars/ for global functions
MULTIBRANCH: auto-discovers branches, each gets own Jenkinsfile

COMMON EXAM TOPICS:
  Difference: Freestyle vs Pipeline jobs
  Agent: any / label / docker / kubernetes
  Artifact archiving: archiveArtifacts, stash/unstash
  Test results: junit 'results/*.xml'
```
