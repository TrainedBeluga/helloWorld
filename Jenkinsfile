pipeline {
    environment {
        registry = "dtr.alexg.dtcntr.net/admin/helloworld"
        registryCredential = 'admin'
    }
    agent any
    triggers{
        GenericTrigger(
            token: 'build'
        )
    }
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
}