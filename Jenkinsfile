pipeline {
    agent any
    parameters {
        booleanParam(name: 'AUTO_APPROVE', defaultValue: false, description: 'Skip manual approval?')
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Approval') {
            when {
                expression { params.AUTO_APPROVE == false }
            }
            steps {
                input message: 'Apply this Terraform plan?', ok: 'Apply'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
