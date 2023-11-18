pipeline {
    agent any
    triggers {
    githubPush
    }

    stages {
        stage('terraform init') {
            steps {
                sh ''' terraform init
                       terraform plan '''
            }
        }
