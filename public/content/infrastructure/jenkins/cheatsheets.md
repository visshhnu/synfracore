# Jenkins — Cheatsheet

```bash
# ── JENKINS CLI ───────────────────────────────────────────
# Download CLI
curl -o jenkins-cli.jar http://jenkins:8080/jnlpJars/jenkins-cli.jar

# Run CLI commands
java -jar jenkins-cli.jar -s http://jenkins:8080 -auth admin:token help
java -jar jenkins-cli.jar -s http://jenkins:8080 -auth admin:token list-jobs
java -jar jenkins-cli.jar -s http://jenkins:8080 -auth admin:token build my-job
java -jar jenkins-cli.jar -s http://jenkins:8080 -auth admin:token build my-job -p ENV=prod
java -jar jenkins-cli.jar -s http://jenkins:8080 -auth admin:token safe-restart

# ── JENKINS API ───────────────────────────────────────────
# List jobs
curl -u admin:token http://jenkins:8080/api/json?tree=jobs[name]

# Trigger build
curl -X POST -u admin:token http://jenkins:8080/job/my-job/build

# Trigger with parameters
curl -X POST -u admin:token \
  "http://jenkins:8080/job/my-job/buildWithParameters?ENV=prod&VERSION=1.2.3"

# Get build status
curl -u admin:token http://jenkins:8080/job/my-job/lastBuild/api/json?tree=result,duration

# Get console output
curl -u admin:token http://jenkins:8080/job/my-job/42/consoleText
```

## Declarative Pipeline Quick Reference

```groovy
pipeline {
    // WHERE to run
    agent { label 'linux' }
    agent { docker { image 'node:20' } }
    agent none  // Define per-stage

    // ENVIRONMENT VARIABLES
    environment {
        APP_NAME = 'myapp'
        CREDS    = credentials('my-secret')  // Sets CREDS_USR + CREDS_PSW
    }

    // PARAMETERS (manual triggers)
    parameters {
        string(name: 'VERSION', defaultValue: 'latest')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false)
        choice(name: 'ENV', choices: ['dev', 'staging', 'prod'])
    }

    // TRIGGERS
    triggers {
        cron('H 2 * * 1-5')           // Mon-Fri at 2am
        pollSCM('H/5 * * * *')        // Poll Git every 5 min
        upstream(upstreamProjects: 'other-job', threshold: SUCCESS)
    }

    // TOOLS
    tools { nodejs 'NodeJS-20'; maven 'Maven-3.9' }

    // OPTIONS
    options {
        timeout(time: 30, unit: 'MINUTES')
        retry(2)
        skipStagesAfterUnstable()
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    stages {
        stage('Example') {
            // WHEN conditions
            when {
                branch 'main'
                not { branch 'develop' }
                anyOf { branch 'main'; branch 'release/*' }
                environment name: 'DEPLOY', value: 'true'
                expression { params.ENV == 'prod' }
                changeset '**/src/**'           // Only if these files changed
            }

            // MATRIX — run same stage in parallel with different config
            matrix {
                axes {
                    axis { name 'OS'; values 'linux', 'windows' }
                    axis { name 'NODE'; values '18', '20' }
                }
                stages {
                    stage('Build') { steps { sh "npm test" } }
                }
            }
        }
    }

    // POST conditions
    post {
        always   { junit 'results/*.xml' }
        success  { slackSend color: 'good', message: "✅ ${env.JOB_NAME}" }
        failure  { slackSend color: 'danger', message: "❌ ${env.JOB_NAME}" }
        unstable { slackSend color: 'warning', message: "⚠️ ${env.JOB_NAME}" }
        changed  { echo "Status changed from previous build" }
        fixed    { echo "Build is fixed!" }
    }
}
```
