# Jenkins — Installation Guide

## Option 1: Docker (Fastest — Recommended for Learning)

```bash
# Create a persistent volume for Jenkins data
docker volume create jenkins-data

# Run Jenkins
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  jenkins/jenkins:lts-jdk17

# Get the initial admin password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

Open http://localhost:8080 and paste the password.

**Setup wizard:**
1. Paste the password
2. Click "Install suggested plugins" (takes 2-3 minutes)
3. Create your admin user
4. Keep the default URL (http://localhost:8080)
5. Click "Start using Jenkins"

## Option 2: Install on Ubuntu/Debian Server

```bash
# Install Java (Jenkins requires Java 17 or 21)
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version   # openjdk version "17.x.x"

# Add Jenkins repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update && sudo apt install jenkins -y

# Start Jenkins
sudo systemctl enable --now jenkins
sudo systemctl status jenkins

# Get admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Access at http://YOUR-SERVER-IP:8080

## Option 3: Kubernetes (Helm)

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm install jenkins jenkins/jenkins \
  --namespace jenkins --create-namespace \
  --set controller.adminPassword=MyPassword \
  --set controller.serviceType=NodePort

# Get access
kubectl exec -n jenkins -it svc/jenkins -c jenkins -- \
  /bin/cat /run/secrets/additional/chart-admin-password
kubectl port-forward -n jenkins svc/jenkins 8080:8080
```

## Essential Plugins to Install

After first login → Manage Jenkins → Plugins → Available:

```
Docker Pipeline         — run pipeline steps inside Docker containers
Blue Ocean              — modern pipeline visualization UI
GitHub Integration      — webhook-based GitHub builds
Credentials Binding     — inject secrets safely into pipelines
Slack Notification      — send build results to Slack
HTML Publisher          — publish test coverage reports
JUnit                   — parse and display test results
Pipeline Utility Steps  — readJSON, readYaml, findFiles helpers
Kubernetes              — dynamic Kubernetes-based agents
```

## Create Your First Pipeline

```groovy
// New Item → Pipeline → paste this as Pipeline Script:
pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                sh 'echo "Jenkins is working!"'
                sh 'java -version'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Building..."'
            }
        }
    }
    post {
        success { echo 'Pipeline succeeded!' }
        failure { echo 'Pipeline failed!' }
    }
}
```

Click Build Now → Console Output — you should see "Jenkins is working!"

## Configure GitHub Webhook

So Jenkins builds on every push:
1. Jenkins → Manage Jenkins → Configure System → GitHub → Add Server
2. On GitHub repo: Settings → Webhooks → Add webhook
3. URL: `http://YOUR-JENKINS-IP:8080/github-webhook/`
4. Content type: `application/json`
5. Events: Just the push event

## Next Steps

Jenkins is running. Go to **Fundamentals** to learn Declarative Pipelines and connect your first real project.
