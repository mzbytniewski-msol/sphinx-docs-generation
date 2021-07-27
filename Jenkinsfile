pipeline {
    agent any
    options {
        quietPeriod(0)
        timestamps()
    }
    stages {
        stage('Checkout submodules') {
            steps {
                echo 'Checkout submodules'
                // sh 'git submodule update --init --recursive'
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
                sh 'pushd ${WORKSPACE}/build/ && zip -r ./documentation.zip .'
                // stash includes: '${WORKSPACE}/build', name: 'build_results'
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