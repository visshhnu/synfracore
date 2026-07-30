# Jenkins — Fundamentals

**Analogy** — A `Jenkinsfile`'s `stages` block is like a factory assembly line with quality gates, not one person doing everything at a single bench. Each `stage` (Checkout, Test, Build, Deploy) is one station on the line — an item only reaches the next station if it passes the current one, and each station can be staffed by a different, specialized worker (a different `container`/`agent`, as seen in the `kubectl`/`docker` container split below). A failed `Test` stage stops the item right there — it never reaches `Deploy` half-finished, the same way a factory pulls a defective part off the line rather than shipping it anyway.

```
Checkout → Test → Security Scan → Build Image → Push → Deploy Staging → Smoke Test → Deploy Prod
    │         │                                                              │
    └── each arrow only happens if the stage before it succeeded ───────────┘
```

## Declarative Pipeline

```groovy
// Jenkinsfile
pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: build
    image: node:20-alpine
    command: [sleep, infinity]
  - name: docker
    image: docker:24-dind
    securityContext:
      privileged: true
'''
        }
    }

    environment {
        APP_NAME = 'my-app'
        DOCKER_REGISTRY = 'registry.example.com'
        IMAGE_TAG = "${BUILD_NUMBER}-${GIT_COMMIT.take(7)}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                container('build') {
                    sh 'npm ci'
                    sh 'npm run test -- --coverage'
                }
            }
            post {
                always {
                    junit 'test-results/*.xml'
                    // Record coverage with the Coverage plugin (record its own
                    // report format -- e.g. lcov/Cobertura/JaCoCo -- not a generic
                    // "gauge" step; the exact parser/pattern depends on what your
                    // test runner emits):
                    recordCoverage(tools: [[parser: 'COBERTURA', pattern: 'coverage/cobertura-coverage.xml']])
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                container('docker') {
                    sh "docker build -t ${DOCKER_REGISTRY}/${APP_NAME}:${IMAGE_TAG} ."
                    withCredentials([usernamePassword(
                        credentialsId: 'registry-creds',
                        usernameVariable: 'REG_USER',
                        passwordVariable: 'REG_PASS'
                    )]) {
                        sh "docker login -u ${REG_USER} -p ${REG_PASS} ${DOCKER_REGISTRY}"
                        sh "docker push ${DOCKER_REGISTRY}/${APP_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                container('build') {
                    withKubeConfig([credentialsId: 'staging-k8s']) {
                        sh """
                            kubectl set image deployment/${APP_NAME} \
                              ${APP_NAME}=${DOCKER_REGISTRY}/${APP_NAME}:${IMAGE_TAG} \
                              -n staging
                            kubectl rollout status deployment/${APP_NAME} -n staging
                        """
                    }
                }
            }
        }

        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            input {
                message "Deploy to production?"
                ok "Deploy"
            }
            steps {
                container('build') {
                    withKubeConfig([credentialsId: 'prod-k8s']) {
                        sh """
                            kubectl set image deployment/${APP_NAME} \
                              ${APP_NAME}=${DOCKER_REGISTRY}/${APP_NAME}:${IMAGE_TAG} \
                              -n production
                            kubectl rollout status deployment/${APP_NAME} -n production
                        """
                    }
                }
            }
        }
    }

    post {
        failure {
            slackSend(
                channel: '#deployments',
                color: 'danger',
                message: "Build failed: ${env.JOB_NAME} #${env.BUILD_NUMBER} - ${env.BUILD_URL}"
            )
        }
        success {
            slackSend(
                channel: '#deployments',
                color: 'good',
                message: "Deployed ${APP_NAME}:${IMAGE_TAG} to production"
            )
        }
    }
}
```

## Shared Libraries

```groovy
// vars/dockerBuild.groovy (shared library)
def call(Map config) {
    def registry = config.registry ?: 'registry.example.com'
    def tag = config.tag ?: "${env.BUILD_NUMBER}"

    container('docker') {
        sh "docker build -t ${registry}/${config.image}:${tag} ${config.context ?: '.'}"
        withCredentials([usernamePassword(credentialsId: 'registry-creds',
            usernameVariable: 'U', passwordVariable: 'P')]) {
            sh "docker login -u ${U} -p ${P} ${registry}"
            sh "docker push ${registry}/${config.image}:${tag}"
        }
    }
    return "${registry}/${config.image}:${tag}"
}

// Usage in Jenkinsfile
@Library('my-shared-lib') _

pipeline {
    stages {
        stage('Build') {
            steps {
                script {
                    def imageRef = dockerBuild(
                        image: 'my-app',
                        tag: "${BUILD_NUMBER}-${GIT_COMMIT.take(7)}"
                    )
                    env.IMAGE_REF = imageRef
                }
            }
        }
    }
}
```

## Credentials and Security

```groovy
// Secret text
withCredentials([string(credentialsId: 'api-key', variable: 'API_KEY')]) {
    sh 'curl -H "Authorization: Bearer $API_KEY" https://api.example.com'
}

// Username/password
withCredentials([usernamePassword(
    credentialsId: 'db-creds',
    usernameVariable: 'DB_USER',
    passwordVariable: 'DB_PASS'
)]) {
    sh 'psql -U $DB_USER -h $DB_HOST'
}

// SSH key
withCredentials([sshUserPrivateKey(
    credentialsId: 'deploy-key',
    keyFileVariable: 'KEY_FILE'
)]) {
    sh 'ssh -i $KEY_FILE deploy@server.example.com'
}

// File
withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
    sh 'kubectl get pods'
}
```

## Try It (2 Minutes)

Using the Jenkins container from the Overview tab's Try It (or any running Jenkins instance), create a Pipeline job with this minimal script — no Kubernetes or Docker needed to see the assembly-line behavior:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps { echo 'Build stage running...' }
        }
        stage('Test') {
            steps { sh 'exit 1' }   // simulate a failing test
        }
        stage('Deploy') {
            steps { echo 'Deploy stage running...' }
        }
    }
}
```

Run it and look at the **Stage View**. `Build` shows green, `Test` shows red and stops the pipeline, and `Deploy` never runs at all — shown as skipped, not failed. That's the assembly-line diagram above in action: a defective item never reaches the next station.
