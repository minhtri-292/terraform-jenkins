pipeline {
    agent any
     environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/minhtri-292/terraform-jenkins.git']])
                sh 'whoami'
            }
        }

        stage ("create infra") {
            steps {
                sh ' terraform -chdir=./infra init'
                sh ' terraform -chdir=./infra apply -auto-approve'
            }
        }
    }
}
        
