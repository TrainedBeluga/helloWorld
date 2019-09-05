node {
    stage('clone') {
        checkout scm
    }

    stage('build') {
        docker_image = docker.build("dtr.alexg.dtcntr.net/admin/helloworld")
    }
}