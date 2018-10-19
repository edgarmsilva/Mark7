pipeline {
    agent {
        docker {
            image 'ruby'
            args '--link selenium'
        }
    }
    environment {
        CI = true
    } 

    stages {
        stage ('bundle'){
            steps {
                // sh "bundle install"
                "bundle install"
            }
        }
        stage ('Run Features'){
            steps{
                // sh "bundle exec cucumber -p ci"
                "bundle exec cucumber -p ci"
                // sh "bundle exec cucumber -t @nova_tarefa"
            }
        }
    }
}