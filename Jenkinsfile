pipeline {
    agent any

    environment {
        SONAR_SERVER = 'SonarQube'
        APP_NAME     = 'spring-petclinic'
        PORT         = '8081'
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
                script {
                    withSonarQubeEnv("${env.SONAR_SERVER}") {
                        sh './mvnw sonar:sonar'
                    }
                }
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
