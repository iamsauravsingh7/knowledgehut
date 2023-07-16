pipeline {
  agent any
  stages {
    stage('Build') {
        steps {
          sh 'cd jpetstore6 && mvn clean package'
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
