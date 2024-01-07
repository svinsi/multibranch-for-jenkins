pipeline {
    agent any
    triggers {
        pollSCM('H/5 * * * *')
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }
        stage('Check commit message') {
            steps {
                script {
                    def commitMessage = sh(script: "git log -1 --pretty=%B", returnStdout: true).trim()
                    echo "Commit message: ${commitMessage}"
                    def jiraPattern = ~/(?i)[A-Z]+-\d+/
                    if (!jiraPattern.matcher(commitMessage).find()) {
                        error "Commit message does not follow the best practices."
                    }
                }
            }
        }
        stage('Lint Dockerfile') {
            steps {
                sh 'docker run --rm -i hadolint/hadolint < Dockerfile'
            }
        }
    }
}
