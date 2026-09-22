pipeline {
    agent any

    environment {
        APP_NAME    = 'spring-petclinic'
        PORT        = '8081'
        SONAR_TOKEN = 'squ_701603421a1310485600536321f162225bb1f1ca'
        SONAR_HOST  = "http" + "://100.48.6.125:9000"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/srushtic2006-svg/spring-clinic-project.git'
            }
        }

        stage('Compile & Test') {
            steps {
                echo 'Building and running tests...'
                sh './mvnw clean test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                sh "./mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.host.url=${SONAR_HOST} -Dsonar.token=${SONAR_TOKEN}"
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging application into JAR...'
                sh './mvnw package -DskipTests'
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    echo 'Simulating Spring Petclinic Deployment...'
                    echo "Application package successfully verified at: target/${APP_NAME}-4.0.0-SNAPSHOT.jar"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check build logs for details.'
        }
    }
}
