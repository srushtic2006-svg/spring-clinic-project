pipeline {
    agent any

    environment {
        APP_NAME    = 'spring-petclinic'
        PORT        = '8081'
        SONAR_TOKEN = 'squ_701603421a1310485600536321f162225bb1f1ca'
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
                sh "./mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.host.url=http://100.48.6.125:9000 -Dsonar.token=${SONAR_TOKEN}"
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
                    echo 'Deploying Spring Petclinic Application...'
                    sh '''
                        docker stop ${APP_NAME} || true
                        docker rm ${APP_NAME} || true
                        docker build -t ${APP_NAME}:latest .
                        docker run -d --name ${APP_NAME} -p ${PORT}:8080 ${APP_NAME}:latest
                    '''
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
