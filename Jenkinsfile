pipeline {
    agent any

    environment {
        APP_NAME              = 'spring-petclinic'
        SONAR_TOKEN           = 'squ_701603421a1310485600536321f162225bb1f1ca'
        SONAR_HOST            = "http://44.192.118.8:9000"
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        DOCKER_IMAGE          = 'YOUR_ACTUAL_USERNAME/spring-petclinic'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop', url: 'https://github.com/srushtic2006-svg/spring-clinic-project.git'
            }
        }

        stage('Compile & Test') {
            steps {
                sh './mvnw clean test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                sh "./mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.host.url=${SONAR_HOST} -Dsonar.token=${SONAR_TOKEN}"
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        def customImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                        customImage.push()
                        customImage.push('latest')
                    }
                }
            }
        }
    }
}
