pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Run Maven build
                sh 'mvn clean install'
            }
        }
    }

    post {
        always {
            // Send build artifacts over SSH
            sshPublisher(
                publishers: [
                    sshPublisherDesc(
                        configName: 'dockerfile', 
                        transfers: [
                            sshTransfer(
                                sourceFiles: 'target/*.war', 
                                removePrefix: 'target', 
                                remoteDirectory: '.', 
                                execCommand: ''
                            )
                        ]
                    )
                ]
            )
        }
    }
}
