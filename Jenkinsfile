pipeline {
    // agent any
    agent { label 'jenkins-build' }

    stages {

                // Deploy
        stage('Privisioning Slave') {
            steps {
                echo 'Done...'
            }
        }

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

        stage('Linter') {
            steps {
                dir("micro-api/") {
                    echo 'Lint..'
                }
            }
        }

        // Run unit tests
        stage('Unit Tests') {
            steps {
                dir("micro-api/") {
                    sh "ls -lha"
                    echo 'Testing..'
                    sh "npm run unit-test"
                }
            }
        }

        // Run integration tests - @TODO
        stage('Integration Tests') {
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
