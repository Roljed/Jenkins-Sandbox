pipeline {
    agent any
    stages {
        stage('Without Docker') {
            steps {
                sh '''
                    echo "Without Docker"
                    ls -la
                    touch container-no.txt
                '''
            }
        }
        stage('With Docker') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true // for workspace synchronization
                }
            }
            steps {
                sh '''
                    echo "With Docker"
                    npm --version
                    ls -la
                    touch container-yes.txt
                    ls -la
                '''

            }
        }
    }
}
