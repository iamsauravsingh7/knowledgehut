pipeline {
  agent any
  stages {
    stage('Build') {
        steps {
          sh 'cd jpetstore6 && ./mvnw clean package -Dlicense.skip=true'
      }
    }

    stage('Deploy') {
      steps {
        sh 'cp target/jpetstore.war /opt/tomcat/webapps/'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing stage'
      }
    }

  }
}
