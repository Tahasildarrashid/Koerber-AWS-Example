pipeline {
    agent any

    tools{
        maven "localmvn"
    }

    environment{
           APP_NAME = "empappwar"
           RELEASE_NO= "1.0.0"
           DOCKER_USER= "tahasildarrashid"
           IMAGE_NAME= "${DOCKER_USER}"+"/"+"${APP_NAME}"
           IMAGE_TAG= "${RELEASE_NO}-${BUILD_NUMBER}"
    }

    stages {
          stage("SCM checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Tahasildarrashid/Koerber-AWS-Example.git']])
            }
        }

        stage("Build Process"){
            steps{
                script{
                    bat 'mvn clean install'
                }
            }
        }

        stage("Build Image"){
            steps{
                script{
                    bat 'docker build -t tahasildarrashid/empappwar:1.1 .'
                }
            }
        }
        stage("Deploy Image to Hub"){
            steps{
                withCredentials([string(credentialsId: 'dockerHubPassword', variable: 'docker')]) {
                                    bat "echo ${docker} | docker login -u ${DOCKER_USER} --password-stdin"
                                    bat 'docker push tahasildarrashid/empappwar:1.1'
                }
            }
        }
    }
}