pipeline {
  agent any
  environment {
        IMAGE_NAME = 'apache-website'
        CONTAINER_NAME = 'apache-website'
        APP_PORT = '8084'
    }
  stages {
    stage('checkout') {
      steps {
        git branch: 'main',
         url: 'https://github.com/Ramya-Padala/Apache-HTTP-Serve.git'
      }
    }
      stage('build') {
        steps {
          sh '''
          docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .
          '''
        }
      }
    stage(''deploy) {
      steps {
        sh '''
        docker rm -f ${CONTAINER_NAME} >/dev/null 2>&1 || true
        docker run -d \
                        --name ${CONTAINER_NAME} \
                        --restart unless-stopped \
                        -p ${APP_PORT}:80 \
                        ${IMAGE_NAME}:${BUILD_NUMBER}
         echo "Deployment completed."
        '''
      }
    }
  }
    post {
        success {
            echo 'CI/CD pipeline completed successfully.'
            echo 'Open http://YOUR_SERVER_IP:8080'
        }

        failure {
            echo 'Pipeline failed. Check the Jenkins console output.'
        }

        always {
            sh 'docker rm -f apache-test >/dev/null 2>&1 || true'
        }
    }
  }

