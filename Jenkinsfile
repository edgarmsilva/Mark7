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
        stage ('Run Features'){
            steps{
                // sh "bundle exec cucumber"
                sh "bundle exec cucumber -t @nova_tarefa"
            }
        }
    }
}