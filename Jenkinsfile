pipeline{
    agent any;
    stages{
        stage("Code"){
            steps{
               git url:"https://github.com/cvinods555/node-todo-cicd.git", branch:"master" 
            }
        }
        stage("Build"){
            steps{
               sh "docker build -t node-app1 ." 
            }
        }
        stage("Push to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHubCred', passwordVariable: 'dockerPass', usernameVariable: 'dockerUser')]) {
                    sh "docker login -u ${env.dockerUser} -p ${env.dockerPass}"
                    sh "docker image tag node-app1:latest ${env.dockerUser}/node-app1:latest"
                    sh "docker push ${env.dockerUser}/node-app1:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
