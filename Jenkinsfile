pipeline {
    agent any

    environment {
        // Define environment variables for Maven and Tomcat
        MAVEN_HOME = '/path/to/maven'
        TOMCAT_USER = 'tomcat_user'
        TOMCAT_PASSWORD = 'tomcat_password'
        TOMCAT_URL = 'http://your-tomcat-server:8080/manager/text'
        DEPLOY_PATH = '/yourApp'  // The context path where the app will be deployed on Tomcat
    }

    stages {
        stage('Checkout') {
            steps {
                // Checks out the source code from the configured SCM (e.g., Git)
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Building the Maven project
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }
        stage('Test') {
            steps {
                // Running tests in the Maven project
                sh "${MAVEN_HOME}/bin/mvn test"
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Assuming the artifact is a WAR file
                    def warFile = findFiles(glob: '**/*.war')[0].path
                    sh """
                        curl --upload-file ${warFile} \\
                            --user ${TOMCAT_USER}:${TOMCAT_PASSWORD} \\
                            "${TOMCAT_URL}/deploy?path=${DEPLOY_PATH}&update=true"
                    """
                }
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'Build was successful!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
