pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Install') { 
            steps {

                withCredentials([file(credentialsId: 'Envfile', variable: 'configuration')]) {
                    sh "cp ${configuration} .env"
                }

                sh './update_example_zips.sh'
                sh 'node batch/diagramExamples.js'
                sh 'npm install' 
            }
        }
        stage('Build') { 
            steps {
                sh 'npm run build'
            }
        }
        stage('Test') { 
            steps {
                sh 'npm run test_ci'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'build/**/*.*', onlyIfSuccessful: false
        }
    }
}
