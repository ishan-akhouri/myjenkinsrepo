pipeline {
    agent any
    parameters {
        string(name: 'FIRSTNAME', defaultValue: '', description: 'First name')
        string(name: 'LASTNAME', defaultValue: '', description: 'Last name')
        booleanParam(name: 'SHOW', defaultValue: false, description: 'Show name?')
    }
    stages {
        stage('Run Script') {
            steps {
                sh "chmod +x script.sh"
                sh "./script.sh ${params.FIRSTNAME} ${params.LASTNAME} ${params.SHOW}"
            }
        }
    }
}
