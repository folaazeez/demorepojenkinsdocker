pipeline{
  agent {label 'docker-node'}
  environment{
    IMAGE='myapp:${BUILD_NUMBER}'
  }
      stages{
        stage ('Checkout Code'){
            steps{
                checkout scm
            }
        }      
        stage ('Build Image'){
            steps{
                sh 'docker build -t ${IMAGE} .'
            }
        }      
        stage ('Unit Test'){
            steps{
                sh 'docker run --rm ${IMAGE} echo "Running Tests..."'
            }
        }      
        stage ('Deploy'){
            steps{
                sh '''
                docker rm -f myapp || true
                docker run -d --name myapp -p 8080:80
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
