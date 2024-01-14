pipeline {
<<<<<<< HEAD
    agent any
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
=======
    agent {
        docker { image 'node:20.10.0-alpine3.19' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
>>>>>>> 6e8c29a (test dev task should be error)
            }
        }
    }
}
