pipeline {
    agent any

    stages {
        stage('git ,terraform install') {
            steps {
                sh '''sudo yum install git terraform -y
                      terraform'''
            }
        }
    }
}
