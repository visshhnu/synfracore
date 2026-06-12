# Jenkins — Intermediate

## Pipeline as Code Patterns

```groovy
// Reusable helper functions in Jenkinsfile
def deployToEnvironment(String env, String imageTag) {
    withCredentials([string(credentialsId: "${env}-kubeconfig", variable: 'KUBECONFIG_DATA')]) {
        writeFile file: '/tmp/kubeconfig', text: KUBECONFIG_DATA
        sh """
            export KUBECONFIG=/tmp/kubeconfig
            kubectl set image deployment/app app=registry.io/myapp:${imageTag} -n ${env}
            kubectl rollout status deployment/app -n ${env} --timeout=5m
        """
    }
}

def runTests(String type) {
    try {
        sh "npm run test:${type} -- --reporter junit --reporter-options output=results/${type}.xml"
    } finally {
        junit "results/${type}.xml"  // Always publish, even on failure
    }
}

pipeline {
    agent { label 'docker' }
    stages {
        stage('Test') {
            parallel {
                stage('Unit') { steps { script { runTests('unit') } } }
                stage('Integration') { steps { script { runTests('integration') } } }
            }
        }
        stage('Deploy Dev') {
            when { branch 'develop' }
            steps { script { deployToEnvironment('dev', env.BUILD_TAG) } }
        }
        stage('Deploy Prod') {
            when { branch 'main' }
            input { message 'Deploy to production?'; ok 'Deploy' }
            steps { script { deployToEnvironment('prod', env.BUILD_TAG) } }
        }
    }
}
```

## Multi-Branch Pipeline

```groovy
// Jenkinsfile at repo root — auto-discovered for each branch/PR

pipeline {
    agent any
    environment {
        IMAGE_TAG = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}".replaceAll('/', '-')
        IS_MAIN   = "${env.BRANCH_NAME}" == 'main'
    }

    stages {
        stage('Build') {
            steps {
                sh "docker build -t myapp:${IMAGE_TAG} ."
            }
        }

        stage('Security Scan') {
            steps {
                sh "trivy image --exit-code 1 --severity HIGH,CRITICAL myapp:${IMAGE_TAG}"
            }
        }

        stage('Push') {
            when { anyOf { branch 'main'; branch 'develop' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'registry', usernameVariable: 'U', passwordVariable: 'P')]) {
                    sh """
                        docker login -u ${U} -p ${P} registry.io
                        docker push registry.io/myapp:${IMAGE_TAG}
                    """
                }
            }
        }

        stage('Deploy') {
            when { branch 'main' }
            steps {
                build job: 'deploy-pipeline',
                      parameters: [string(name: 'IMAGE_TAG', value: IMAGE_TAG)],
                      wait: true,
                      propagate: true   // Fail this job if deploy fails
            }
        }
    }

    post {
        always {
            cleanWs()   // Clean workspace
        }
        failure {
            emailext(
                to: "${env.CHANGE_AUTHOR_EMAIL}",
                subject: "Build Failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: "Check: ${env.BUILD_URL}"
            )
        }
    }
}
```

## Jenkins Job DSL

```groovy
// jobs/seed.groovy — generates Jenkins jobs programmatically
def services = ['api', 'auth', 'payments', 'notifications']

services.each { service ->
    pipelineJob("${service}-pipeline") {
        description("CI/CD pipeline for ${service}")
        definition {
            cpsScm {
                scm {
                    git {
                        remote { url("https://github.com/myorg/${service}") }
                        branch('*/main')
                    }
                }
                scriptPath('Jenkinsfile')
            }
        }
        triggers {
            scm('H/5 * * * *')   // Poll every 5 minutes
        }
    }

    // Also create a deploy job
    freeStyleJob("${service}-deploy-prod") {
        parameters {
            stringParam('IMAGE_TAG', '', 'Docker image tag to deploy')
        }
        steps {
            shell("./scripts/deploy.sh ${service} \${IMAGE_TAG} production")
        }
        authorizationMatrix {
            permission('hudson.model.Build:ops-team')
        }
    }
}
```
