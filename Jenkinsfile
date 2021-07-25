pipeline {
    agent any
    options {
        quietPeriod(0)
        timestamps()
    }
    stages {
        stage('Checkout submodules') {
            steps {
                echo "Checkout submodules"
            }
        }
        stage('Generate documentation') {
            steps {
                sh 'make github'
            }
        }
        stage('Publish documentation') {
            steps {
                echo "Publish documentation"
            }
        }
    }
}