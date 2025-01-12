pipeline {
    agent any
    environment {
        BUILD_FILE_NAME = 'computer.txt'
    }
    stages {
        stage('Clean workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Build') {
            steps {
                echo 'Building a new laptop'
                sh 'mkdir -p build'
                sh 'touch build/pc.txt'
                sh '''
                   echo "Motherboard" > build/$BUILD_FILE_NAME
                   echo "CPU" >> build/$BUILD_FILE_NAME
                   echo "Memory" >> build/$BUILD_FILE_NAME
                   echo "Storage" >> build/$BUILD_FILE_NAME
                   echo "PSU" >> build/$BUILD_FILE_NAME
                   echo "Case" >> build/$BUILD_FILE_NAME
                   cat build/$BUILD_FILE_NAME
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing the new PC...'
                sh 'test -f build/$BUILD_FILE_NAME'
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'build/**'
        }
    }
}
