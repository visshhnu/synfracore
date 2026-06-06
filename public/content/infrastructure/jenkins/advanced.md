# Jenkins Advanced Pipeline Patterns

## Shared Libraries — Reusable Pipeline Code

```groovy
// In a shared library repo: vars/deployToK8s.groovy
def call(Map config) {
    def environment = config.environment ?: 'staging'
    def namespace   = config.namespace   ?: 'default'
    def imageTag    = config.imageTag    ?: env.BUILD_NUMBER
    def helmChart   = config.helmChart   ?: './helm'

    container('kubectl') {
        withCredentials([file(credentialsId: "kubeconfig-${environment}", variable: 'KUBECONFIG')]) {
            sh """
                helm upgrade --install ${config.releaseName} ${helmChart} \
                  --namespace ${namespace} \
                  --set image.tag=${imageTag} \
                  --values ${helmChart}/values-${environment}.yaml \
                  --wait --timeout 10m --atomic
            """
        }
    }
}
```

```groovy
// Use in any Jenkinsfile
@Library('my-shared-library@main') _

pipeline {
    agent { kubernetes { ... } }
    stages {
        stage('Deploy Staging') {
            steps {
                deployToK8s(
                    environment: 'staging',
                    releaseName: 'myapp',
                    namespace: 'staging',
                    imageTag: env.BUILD_NUMBER
                )
            }
        }
        stage('Deploy Production') {
            when { branch 'main' }
            steps {
                deployToK8s(
                    environment: 'production',
                    releaseName: 'myapp',
                    namespace: 'production',
                    imageTag: env.BUILD_NUMBER
                )
            }
        }
    }
}
```

## Dynamic Parallel Stages

```groovy
pipeline {
    agent any
    stages {
        stage('Test All Services') {
            steps {
                script {
                    // Dynamically generate parallel stages
                    def services = ['auth-service', 'payment-api', 'notification-service', 'user-service']
                    def parallelStages = [:]

                    services.each { service ->
                        def svc = service  // Important: capture for closure
                        parallelStages[svc] = {
                            stage("Test: ${svc}") {
                                dir(svc) {
                                    sh 'npm test'
                                    publishTestResults(testResultsFormat: 'JUnit', testResultsFiles: 'test-results.xml')
                                }
                            }
                        }
                    }

                    parallel parallelStages
                }
            }
        }
    }
}
```

## Matrix Strategy

```groovy
pipeline {
    agent none
    stages {
        stage('Cross-platform Build') {
            matrix {
                axes {
                    axis {
                        name 'PLATFORM'
                        values 'linux', 'windows', 'darwin'
                    }
                    axis {
                        name 'PYTHON_VERSION'
                        values '3.10', '3.11', '3.12'
                    }
                }
                excludes {
                    // Windows + Python 3.10 combination not needed
                    exclude {
                        axis { name 'PLATFORM'; values 'windows' }
                        axis { name 'PYTHON_VERSION'; values '3.10' }
                    }
                }
                agent {
                    label "${PLATFORM}"
                }
                stages {
                    stage('Build') {
                        steps {
                            sh "python${PYTHON_VERSION} setup.py build"
                        }
                    }
                    stage('Test') {
                        steps {
                            sh "python${PYTHON_VERSION} -m pytest"
                        }
                    }
                }
            }
        }
    }
}
```

## Advanced Post Conditions

```groovy
pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
    post {
        always {
            // Always runs — archive artifacts, cleanup
            archiveArtifacts artifacts: 'build/**/*.jar', allowEmptyArchive: true
            cleanWs()
        }
        success {
            slackSend channel: '#deployments',
                color: 'good',
                message: "✅ ${env.JOB_NAME} #${env.BUILD_NUMBER} deployed successfully"
        }
        failure {
            emailext(
                to: 'team@company.com',
                subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
                    Build failed: ${env.BUILD_URL}
                    Branch: ${env.GIT_BRANCH}
                    Commit: ${env.GIT_COMMIT}
                    Failed Stage: ${env.STAGE_NAME}
                """
            )
        }
        unstable {
            slackSend channel: '#ci',
                color: 'warning',
                message: "⚠️ Tests unstable: ${env.JOB_NAME} #${env.BUILD_NUMBER}"
        }
        aborted {
            echo 'Pipeline was manually aborted'
        }
        regression {
            // Previous build was success, this one failed
            slackSend channel: '#alerts',
                color: 'danger',
                message: "🔴 REGRESSION: ${env.JOB_NAME} broke! ${env.BUILD_URL}"
        }
        fixed {
            // Previous build failed, this one succeeded
            slackSend channel: '#deployments',
                color: 'good',
                message: "🟢 FIXED: ${env.JOB_NAME} is green again!"
        }
    }
}
```

## Blue-Green Deployment Pattern

```groovy
pipeline {
    agent { kubernetes { ... } }
    environment {
        IMAGE_TAG = "${env.BUILD_NUMBER}"
        APP_NAME  = "myapp"
    }
    stages {
        stage('Determine Active/Inactive') {
            steps {
                script {
                    // Find current active deployment
                    def activeColor = sh(
                        script: "kubectl get svc ${APP_NAME} -o jsonpath='{.spec.selector.color}'",
                        returnStdout: true
                    ).trim() ?: 'blue'

                    env.ACTIVE_COLOR   = activeColor
                    env.INACTIVE_COLOR = (activeColor == 'blue') ? 'green' : 'blue'
                    echo "Active: ${env.ACTIVE_COLOR}, Deploying to: ${env.INACTIVE_COLOR}"
                }
            }
        }

        stage('Deploy to Inactive') {
            steps {
                sh """
                    helm upgrade --install ${APP_NAME}-${env.INACTIVE_COLOR} ./helm \
                      --set image.tag=${IMAGE_TAG} \
                      --set color=${env.INACTIVE_COLOR} \
                      --set replicaCount=3 \
                      --wait
                """
            }
        }

        stage('Smoke Test Inactive') {
            steps {
                sh """
                    # Test inactive deployment directly (not via main service)
                    curl -f http://${APP_NAME}-${env.INACTIVE_COLOR}:8080/health
                    ./run-smoke-tests.sh ${env.INACTIVE_COLOR}
                """
            }
        }

        stage('Switch Traffic') {
            input {
                message "Switch traffic from ${env.ACTIVE_COLOR} to ${env.INACTIVE_COLOR}?"
                ok "Switch now"
            }
            steps {
                sh """
                    kubectl patch service ${APP_NAME} \
                      -p '{"spec":{"selector":{"color":"${env.INACTIVE_COLOR}"}}}'
                """
            }
        }

        stage('Verify and Cleanup') {
            steps {
                sh "sleep 60 && ./verify-production.sh"
                sh "helm uninstall ${APP_NAME}-${env.ACTIVE_COLOR} || true"
            }
        }
    }
}
```

## Jenkins Configuration as Code (JCasC)

```yaml
# jenkins.yaml — define Jenkins config in code
jenkins:
  systemMessage: "SynfraCore CI/CD Platform"
  numExecutors: 0    # No executors on master
  mode: EXCLUSIVE

  securityRealm:
    ldap:
      server: ldap://ldap.company.com
      rootDN: dc=company,dc=com
      userSearchFilter: uid={0}

  authorizationStrategy:
    roleBased:
      roles:
        global:
          - name: admin
            permissions:
              - Overall/Administer
            assignments:
              - devops-team
          - name: developer
            permissions:
              - Job/Build
              - Job/Read
              - Job/Workspace
            assignments:
              - engineers

credentials:
  system:
    domainCredentials:
      - credentials:
          - usernamePassword:
              id: docker-registry
              username: myregistry
              password: ${REGISTRY_PASSWORD}
              description: "Docker Registry Credentials"
          - string:
              id: slack-token
              secret: ${SLACK_TOKEN}
              description: "Slack notification token"
          - file:
              id: kubeconfig-prod
              fileName: kubeconfig
              secretBytes: ${KUBECONFIG_BASE64}

unclassified:
  slackNotifier:
    teamDomain: mycompany
    tokenCredentialId: slack-token
    room: "#jenkins"

tool:
  git:
    installations:
      - name: Default
        home: git
```

## Pipeline Performance Optimization

```groovy
pipeline {
    // Reuse the same pod for all stages (faster than spinning up new pods)
    agent {
        kubernetes {
            yaml """
spec:
  containers:
  - name: build
    image: node:20-alpine
    command: ['cat']
    tty: true
  - name: docker
    image: docker:24-dind
    securityContext:
      privileged: true
  - name: helm
    image: alpine/helm:3.14.0
    command: ['cat']
    tty: true
"""
        }
    }

    options {
        // Speed up by not checking out again if nothing changed
        skipDefaultCheckout()
        // Timestamps in logs
        timestamps()
        // Timeout entire pipeline
        timeout(time: 1, unit: 'HOURS')
        // Discard old builds
        buildDiscarder(logRotator(numToKeepStr: '20'))
        // Don't run concurrent builds of same branch
        disableConcurrentBuilds()
    }

    stages {
        stage('Checkout') {
            steps {
                // Only checkout once
                checkout scm
                // Cache node_modules between builds
                cache(maxCacheSize: 250, caches: [
                    arbitraryFileCache(path: 'node_modules', cacheValidityDecidingFile: 'package-lock.json')
                ]) {
                    sh 'npm ci'
                }
            }
        }
    }
}
```
