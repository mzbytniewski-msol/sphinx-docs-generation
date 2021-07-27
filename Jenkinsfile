pipeline {
    agent any
    options {
        quietPeriod(0)
        timestamps()
    }
    stages {
        stage('Cleanup workspace') {
            steps {
                cleanWs()
            }
        }
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
                zip -r ./documentation.zip ./singlehtml
                '''
                archiveArtifacts artifacts: 'build/documentation.zip', followSymlinks: false, onlyIfSuccessful: true
                stash includes: 'build/', name: 'build_results'
            }
        }
        stage('Publish documentation') {
            steps {
                unstash 'build_results'
            }
        }
    }
}