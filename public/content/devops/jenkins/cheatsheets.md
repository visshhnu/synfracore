# Jenkins Quick Reference

```groovy
// Basic Declarative Pipeline
pipeline {
    agent any
    options {
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    triggers { cron('H 2 * * 1-5') }  // weekdays at 2am
    environment { REGISTRY = 'registry.example.com' }
    
    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Test') {
            steps { sh 'npm test' }
            post { always { junit 'reports/*.xml' } }
        }
        stage('Build') {
            when { branch 'main' }
            steps {
                sh 'docker build -t ${REGISTRY}/myapp:${BUILD_NUMBER} .'
                withCredentials([string(credentialsId: 'registry-token', variable: 'TOKEN')]) {
                    sh 'docker login ${REGISTRY} -u admin -p ${TOKEN}'
                    sh 'docker push ${REGISTRY}/myapp:${BUILD_NUMBER}'
                }
            }
        }
        stage('Deploy') {
            when { branch 'main' }
            steps {
                withKubeconfig([credentialsId: 'k8s-config']) {
                    sh "helm upgrade --install myapp ./chart --set image.tag=${BUILD_NUMBER}"
                }
            }
        }
    }
    post {
        failure {
            slackSend(channel: '#ci-alerts', message: "Failed: ${JOB_NAME} #${BUILD_NUMBER}")
        }
    }
}
```

## Useful Jenkins CLI Commands

```bash
java -jar jenkins-cli.jar -s http://jenkins:8080 build my-job -w
java -jar jenkins-cli.jar -s http://jenkins:8080 list-jobs
java -jar jenkins-cli.jar -s http://jenkins:8080 get-job my-job
```
