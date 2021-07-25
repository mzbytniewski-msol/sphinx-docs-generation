pipeline {
    agent {
        label 'small'
    }
    stages {
        stage('Checkout submodules') {
            steps {
                echo "Checkout submodules"
            }
        stage('Generate documentation') {
            steps {
                echo "Generate documentation"
            }
        }
        stage('Publish documentation') {
            steps {
                echo "Publish documentation"
            }
        }
    }
}