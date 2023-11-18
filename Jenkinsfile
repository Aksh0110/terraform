pipeline {
    agent any
    triggers {
    githubPush
    }

    stages {
        stage('terraform init') {
            steps {
                sh ''' sudo cd /var/lib/jenkins/workspace/demo-web/
                       terraform init
                       terraform plan '''
            }
        }
    }
}
