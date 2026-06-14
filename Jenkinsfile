@Library('myjenkins-sharedlib') _

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
                greetUser(params.FIRSTNAME, params.LASTNAME, "${params.SHOW}")
            }
        }
    }
}
