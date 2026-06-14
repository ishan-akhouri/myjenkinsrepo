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
                sh "./script.sh ${params.FIRSTNAME} ${params.LASTNAME} ${params.SHOW}"
            }
        }
        stage('Show Notice') {
            when {
                expression { params.SHOW == false }
            }
            steps {
                echo "Reminder: name was not displayed because SHOW was false"
            }
        }
    }
}
