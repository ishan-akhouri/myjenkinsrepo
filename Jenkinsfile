pipeline {
    agent any
    parameters {
        booleanParam(name: 'AUTO_APPROVE', defaultValue: false, description: 'Skip manual approval?')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Apply or destroy infrastructure')
    }
    stages {
        stage('Terraform Init') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY'),
                    string(credentialsId: 'db-password', variable: 'TF_VAR_db_password')
                ]) {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY'),
                    string(credentialsId: 'db-password', variable: 'TF_VAR_db_password')
                ]) {
                    script {
                        if (params.ACTION == 'apply') {
                            sh 'terraform plan -out=tfplan'
                        } else {
                            sh 'terraform plan -destroy -out=tfplan'
                        }
                    }
                }
            }
        }
        stage('Approval') {
            when {
                expression { params.AUTO_APPROVE == false }
            }
            steps {
                input message: "${params.ACTION.toUpperCase()} this plan?", ok: 'Confirm'
            }
        }
        stage('Terraform Execute') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY'),
                    string(credentialsId: 'db-password', variable: 'TF_VAR_db_password')
                ]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    post {
        success {
            sh 'terraform output || true'
        }
    }
}
