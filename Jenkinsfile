pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Target environment')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip tests?')
    }
    stages {
        stage('Build') {
            steps {
                echo "Building for ${params.ENVIRONMENT}..."
            }
        }
        stage('Test') {
            when {
                expression { params.SKIP_TESTS == false }
            }
            steps {
                echo "Running tests..."
            }
        }
        stage('Deploy') {
            when {
                expression { params.ENVIRONMENT == 'prod' }
            }
            steps {
                echo "Deploying to PRODUCTION"
            }
        }
    }
}

