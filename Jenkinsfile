pipeline {
    agent any
    parameters {
        string(name: 'FIRSTNAME', defaultValue: '', description: 'First name')
        string(name: 'LASTNAME', defaultValue: '', description: 'Last name')
        booleanParam(name: 'SHOW', defaultValue: false, description: 'Show name?')
    }
    stages {
        stage('Prepare') {
            steps {
                sh "chmod +x script.sh"
                echo "Build number: ${BUILD_NUMBER}"
                echo "Job name: ${JOB_NAME}"
                echo "Workspace: ${WORKSPACE}"
            }
        }
        stage('Run Script') {
            steps {
                withCredentials([string(credentialsId: 'demo-api-key', variable: 'API_KEY')]) {
                    sh "./script.sh ${params.FIRSTNAME} ${params.LASTNAME} ${params.SHOW} \$API_KEY > output-${BUILD_NUMBER}.txt"
                }
                sh "cat output-${BUILD_NUMBER}.txt"
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: "output-${BUILD_NUMBER}.txt", fingerprint: true
        }
        success {
            echo "Build ${BUILD_NUMBER} succeeded for ${JOB_NAME}"
        }
        failure {
            echo "Build ${BUILD_NUMBER} failed - check output-${BUILD_NUMBER}.txt"
        }
    }
}
