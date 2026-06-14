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
            }
        }
        stage('Run Script') {
            steps {
                withCredentials([string(credentialsId: 'demo-api-key', variable: 'API_KEY')]) {
                    sh "./script.sh ${params.FIRSTNAME} ${params.LASTNAME} ${params.SHOW} \$API_KEY"
                }
            }
        }
    }
}
