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
        stage ('Build Image'){
            steps{
                sh 'docker build -t $IMAGE .'
            }
        }      
        stage ('Unit Test'){
            steps{
                sh 'docker run --rm $IMAGE echo "Running Tests..."'
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
    always{
      sh 'docker system prune -f'
    }
    cleanup { cleanWs() }
  }
}
