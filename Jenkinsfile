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
                sh '''
                cd ${WORKSPACE}/build/
                zip -r ./documentation.zip *
                '''
                // archiveArtifacts artifacts: 'documentation.zip', followSymlinks: false, onlyIfSuccessful: true
                sh 'pwd && ls -l'
                stash includes: 'build/', name: 'build_results'
            }
        }
        stage('Publish documentation') {
            steps {
                echo "Publish documentation"
            }
        }
    }
}