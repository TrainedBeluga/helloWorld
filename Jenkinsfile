pipeline {
    environment {
        registry = "docker.build dtr.alexg.dtcntr.net/admin/helloworld"
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
                    dockerImage = registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('push') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Remove unused docker image') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}