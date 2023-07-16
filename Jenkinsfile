pipeline {
  agent any
  stages {
    stage('Build') {
        steps {
          sh './mvnw clean package -Dlicense.skip=true'
      }
    }

    stage('Deploy') {
      steps {
        sh 'cp jpetstore6/target/jpetstore.war $WORKSPACE'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing stage'
      }
    }

  }
}
