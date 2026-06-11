# Jenkins — Fundamentals

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
                    publishCoverageGauges([
                        [metric: 'LINE', threshold: 80]
                    ])
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
