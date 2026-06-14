pipeline {
    agent any
    parameters {
        string(name: 'FIRSTNAME', defaultValue: '', description: 'First name')
        // Updated LASTNAME from string to choice
        choice(
            name: 'LASTNAME', 
            choices: ['Doe', 'Smith', 'Jenkins'], 
            description: 'Last name'
        )
        booleanParam(name: 'SHOW', defaultValue: false, description: 'Show name?')
    }
    stages {
        stage('Run Script') {
            steps {
                // The sh step remains the same as it correctly references the parameter
                sh "sudo /home/oracle/script.sh ${params.FIRSTNAME} ${params.LASTNAME} ${params.SHOW}"
            }
        }
    }
}


















