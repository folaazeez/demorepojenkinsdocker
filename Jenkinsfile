pipeline{
  agent {label 'docker-node'}
  environment{
    IMAGE = "myapp:${env.BUILD_NUMBER}"
  }
      stages{
        stage ('Checkout Code'){
            steps{
                checkout scm
            }
        }      
        stage ('Clear Old'){
            steps{
                sh 'docker rmi $IMAGE 2>/dev/null'
            }
        }           
        stage ('Build Image'){
            steps{
                sh 'docker build -t $IMAGE .'
            }
        }      
   
        stage ('Deploy'){
            steps{
                sh '''
                docker rm -f myapp 2</dev/null
                docker run -d --name myapp -p 8080:80 $IMAGE
                '''
            }
        }      
    }
  post {
    success{
      echo 'Deployment successful'
    }
    failure{
      echo 'Deplyment failed!'
    }    
    always{
      sh 'docker system prune -f'
    }
    cleanup { cleanWs() }
  }
}
