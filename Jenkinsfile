pipeline {
    environment {
        registry = "dtr.alexg.dtcntr.net/admin/helloworld"
        registryCredential = 'admin'
    }
    agent any
    stages{
        stage('clone') {
            steps {
                checkout scm
            }
        }

        stage('build') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }

        stage('push') {
            steps{
                script {
                    docker.withRegistry( 'https://dtr.alexg.dtcntr.net', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
    stages{
        stage('test1'){
            
        }
    }
}