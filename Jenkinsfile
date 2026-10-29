pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git branch: 'main',
         url: 'https://github.com/Ramya-Padala/Apache-HTTP-Serve.git'
      }
    }
      stage('build') {
        steps {
          echo "build the apache application"
        }
      }
  }
}
          
