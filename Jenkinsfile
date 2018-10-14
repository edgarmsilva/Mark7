pipeline {
    agent {
        docker {
            image 'ruby'
        }
    }
    environment {
        CI = true
    } 

    stages {
        stage ('bundle'){
            steps {
                sh "bundle install"
            }
        }
    }
}