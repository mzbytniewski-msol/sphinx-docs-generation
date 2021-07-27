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
            agent {
                dockerfile {
                    label '!master'
                    args '-v ${WORKSPACE}:/workspace'
                }
            }
            steps {
                sh 'make singlehtml'
            }
        }
        stage('Publish documentation') {
            steps {
                echo "Publish documentation"
            }
        }
    }
}