pipeline {
    agent any

    stages {

        // Build General Dependencies
        stage('Dependencies') {
            steps {
                sh "apt-get install -y"
                sh "curl -sL https://deb.nodesource.com/setup_8.x | bash -"
                sh "apt-get install -y nodejs"
            }
        }

        //  Build package and install vendor packages
        stage('Build') {
            steps {
                echo 'Building..'
                sh "git clone https://github.com/msfidelis/micro-api.git"
                dir("micro-api/") {
                    sh "pwd"
                    sh "npm install"
                    sh "ls -lha"
                }
            }
        }

        // Run unit tests
        stage('Test') {
            steps {
                dir("micro-api/") {
                    sh "ls -lha"
                    echo 'Testing..'
                    sh "npm run unit-test"
                }
            }
        }

        // Deploy
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }

    post {
        always {
            // Clean Workspace
            cleanWs()
        }
    }
}
