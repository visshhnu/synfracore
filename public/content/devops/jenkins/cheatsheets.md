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

## Quick Reference — Jenkins

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.
