# Jenkins — CI/CD Automation

Jenkins is the most widely deployed open-source CI/CD server in the world. It automates the build, test, and deployment pipeline — turning every `git push` into a tested, deployed artifact.

## What is Jenkins?

Jenkins is an automation server that:
- **Builds** your code on every commit
- **Tests** it automatically (unit, integration, security scans)
- **Packages** it into a deployable artifact (Docker image, JAR, zip)
- **Deploys** it to environments (dev → staging → production)

The core value: **eliminate manual, error-prone human steps** in software delivery.

## Architecture

```
Developer pushes code
        │
        ▼
    GitHub/GitLab
        │ Webhook triggers
        ▼
  Jenkins Master (Controller)
        │ Distributes work
        ├──→ Agent Node 1 (build)
        ├──→ Agent Node 2 (test)
        └──→ Agent Node 3 (deploy)
        │
        ▼
   Artifacts → Docker Registry
                     │
                     ▼
              Kubernetes Deployment
```

**Controller** — Manages the Jenkins UI, stores job configs, schedules builds, distributes work to agents.

**Agent** — Where builds actually run. Can be permanent (always-on VMs) or ephemeral (Kubernetes pods that spin up per build and die after).

**Pipeline** — A `Jenkinsfile` checked into your repo defining all stages. **Infrastructure as code for CI/CD.**

## Declarative Pipeline — The Standard

```groovy
// Jenkinsfile — stored in your Git repository root

pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:24-dind
    securityContext:
      privileged: true
  - name: kubectl
    image: bitnami/kubectl:1.29
    command: ['cat']
    tty: true
"""
        }
    }

    environment {
        IMAGE_NAME    = "myapp"
        REGISTRY      = "myregistry.azurecr.io"
        IMAGE_TAG     = "${env.BUILD_NUMBER}-${env.GIT_COMMIT.take(7)}"
        FULL_IMAGE    = "${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
    }

    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '20'))
        disableConcurrentBuilds()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log --oneline -5'
            }
        }

        stage('Unit Tests') {
            steps {
                sh '''
                    pip install -r requirements.txt
                    pytest tests/unit/ -v --junitxml=test-results.xml
                '''
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }

        stage('Security Scan') {
            steps {
                sh 'trivy fs --exit-code 1 --severity HIGH,CRITICAL .'
            }
        }

        stage('Build Docker Image') {
            steps {
                container('docker') {
                    sh "docker build -t ${FULL_IMAGE} ."
                }
            }
        }

        stage('Push to Registry') {
            when {
                branch 'main'    // Only push from main branch
            }
            steps {
                container('docker') {
                    withCredentials([usernamePassword(
                        credentialsId: 'acr-credentials',
                        usernameVariable: 'REGISTRY_USER',
                        passwordVariable: 'REGISTRY_PASS'
                    )]) {
                        sh '''
                            docker login ${REGISTRY} -u ${REGISTRY_USER} -p ${REGISTRY_PASS}
                            docker push ${FULL_IMAGE}
                            docker tag ${FULL_IMAGE} ${REGISTRY}/${IMAGE_NAME}:latest
                            docker push ${REGISTRY}/${IMAGE_NAME}:latest
                        '''
                    }
                }
            }
        }

        stage('Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                container('kubectl') {
                    withCredentials([file(credentialsId: 'kubeconfig-staging', variable: 'KUBECONFIG')]) {
                        sh """
                            kubectl set image deployment/${IMAGE_NAME} \
                                ${IMAGE_NAME}=${FULL_IMAGE} \
                                -n staging
                            kubectl rollout status deployment/${IMAGE_NAME} \
                                -n staging --timeout=5m
                        """
                    }
                }
            }
        }

        stage('Smoke Test') {
            when { branch 'main' }
            steps {
                sh '''
                    sleep 10
                    curl -f https://staging.myapp.com/health || exit 1
                    echo "Smoke test passed"
                '''
            }
        }

        stage('Deploy to Production') {
            when { branch 'main' }
            input {
                message "Deploy to production?"
                ok "Yes, deploy!"
                parameters {
                    string(name: 'REASON', defaultValue: '', description: 'Reason for deployment')
                }
            }
            steps {
                container('kubectl') {
                    withCredentials([file(credentialsId: 'kubeconfig-prod', variable: 'KUBECONFIG')]) {
                        sh """
                            kubectl set image deployment/${IMAGE_NAME} \
                                ${IMAGE_NAME}=${FULL_IMAGE} \
                                -n production
                            kubectl rollout status deployment/${IMAGE_NAME} \
                                -n production --timeout=10m
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            slackSend(
                channel: '#deployments',
                color: 'good',
                message: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER} deployed ${FULL_IMAGE}"
            )
        }
        failure {
            slackSend(
                channel: '#deployments',
                color: 'danger',
                message: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER} - ${env.BUILD_URL}"
            )
            emailext(
                to: 'team@company.com',
                subject: "Build Failed: ${env.JOB_NAME}",
                body: "Build ${env.BUILD_NUMBER} failed. Check: ${env.BUILD_URL}"
            )
        }
        always {
            cleanWs()    // Clean workspace after build
        }
    }
}
```

## Credentials Management

```groovy
// Never hardcode secrets — use Jenkins credentials store

// Username/Password
withCredentials([usernamePassword(
    credentialsId: 'docker-registry',
    usernameVariable: 'DOCKER_USER',
    passwordVariable: 'DOCKER_PASS'
)]) {
    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
}

// Secret text (API keys, tokens)
withCredentials([string(credentialsId: 'slack-token', variable: 'SLACK_TOKEN')]) {
    sh 'curl -H "Authorization: Bearer $SLACK_TOKEN" ...'
}

// SSH key
withCredentials([sshUserPrivateKey(
    credentialsId: 'deploy-key',
    keyFileVariable: 'SSH_KEY'
)]) {
    sh 'ssh -i $SSH_KEY user@server deploy.sh'
}

// Kubernetes config file
withCredentials([file(credentialsId: 'kubeconfig-prod', variable: 'KUBECONFIG')]) {
    sh 'kubectl get pods -n production'
}
```

## Jenkins on Kubernetes (Recommended Setup)

```bash
# Install Jenkins via Helm
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm install jenkins jenkins/jenkins \
  --namespace jenkins \
  --create-namespace \
  --set controller.serviceType=ClusterIP \
  --set controller.resources.requests.memory=1Gi \
  --set controller.resources.limits.memory=2Gi \
  --set persistence.size=20Gi

# Get admin password
kubectl exec --namespace jenkins -it \
  $(kubectl get pods --namespace jenkins -l "app.kubernetes.io/name=jenkins" -o jsonpath="{.items[0].metadata.name}") \
  -- /bin/cat /run/secrets/additional/chart-admin-password

# Access Jenkins
kubectl port-forward svc/jenkins 8080:8080 -n jenkins
```

## Troubleshooting Common Issues

**Build fails with "Permission denied" on Docker socket:**
```bash
# Add jenkins user to docker group on agent
usermod -aG docker jenkins
# Or use Docker-in-Docker (dind) container in Kubernetes agent
```

**Pipeline hangs at stage with no output:**
```groovy
// Add timeout to prevent infinite hang
timeout(time: 10, unit: 'MINUTES') {
    sh './long-running-script.sh'
}
```

**Deployment failed: `kubectl: command not found`:**
```groovy
// Use specific container in Kubernetes agent
container('kubectl') {
    sh 'kubectl apply -f deployment.yaml'
}
```

**"Expired Azure service principal" error:**
```bash
# Most common in Azure pipelines — service principal credentials expire
# Fix: Rotate the secret, update Jenkins credentials
az ad sp credential reset --name jenkins-sp
# Update Jenkins Credentials → Azure SP → update password
```

## Interview Questions

**What is the difference between a declarative and scripted pipeline?**
Declarative pipeline uses a structured `pipeline {}` block with predefined sections (stages, steps, post). It is opinionated, easier to read, and provides better error messages. Scripted pipeline is raw Groovy code — more flexible but harder to maintain. Best practice: use declarative pipeline always; drop to `script {}` blocks only when you need Groovy logic that declarative cannot handle.

**How do you handle secrets in Jenkins?**
Never hardcode secrets in Jenkinsfile — it gets committed to Git. Store secrets in Jenkins Credentials (encrypted in Jenkins home). Reference with `withCredentials()` block — secrets available as environment variables only within that block, masked in logs. For production: use an external secrets manager (HashiCorp Vault, AWS Secrets Manager) and have Jenkins retrieve at runtime rather than storing in Jenkins itself.

**How do you implement a rollback in a Jenkins pipeline?**
After successful deployment, tag the known-good image as `stable`. If smoke tests fail, the pipeline calls `kubectl rollout undo` to revert to the previous Kubernetes deployment revision, or re-deploys the `stable` tagged image. Always verify rollback health with the same smoke tests. Use `post { failure {} }` block to trigger automatic rollback on any stage failure.
