pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Use the full path to Maven executable on the Jenkins agent
                sh '/opt/maven/bin/mvn clean package'
            }
        }
    }

    post {
        success {
            // Send build artifacts (WAR file) over SSH only if the build is successful
            sshPublisher(
                publishers: [
                    sshPublisherDesc(
                        configName: 'docker-server', // Ensure this matches your SSH server configuration in Jenkins
                        transfers: [
                            sshTransfer(
                                sourceFiles: 'target/*.war', // Path to the WAR file to be transferred
                                removePrefix: 'target' // Remove the 'target/' prefix from the file path in the transfer
                            )
                        ]
                    )
                ]
            )
        }
    }
}
