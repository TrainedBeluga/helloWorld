pipeline {
    environment {
        registry = "dtr.alexg.dtcntr.net/admin/helloworld"
        registryCredential = 'admin'
        ucpCredential='ucpAdmin'
    }
    agent any
    triggers{
        GenericTrigger(
            token: 'build'
        )
    }
    stages{
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            }
        }

        stage('Push') {
            steps{
                script {
                    docker.withRegistry( 'https://dtr.alexg.dtcntr.net', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy'){
            withDockerServer([credentialsId: ucpCredential, uri: 'https://ucp.alexg.dtcntr.net']){
                sh "docker stack deploy -c compose.yml web"
            }
        }
    }
}