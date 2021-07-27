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
                sh 'zip -r ./documentation.zip ${WORKSPACE}/build/*'
                stash includes: './build', name: 'build_results'
                archiveArtifacts artifacts: 'documentation.zip', followSymlinks: false, onlyIfSuccessful: true
            }
        }
        stage('Publish documentation') {
            steps {
                echo "Publish documentation"
            }
        }
    }
}