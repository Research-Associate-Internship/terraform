// global variable used to determine which terraform folder to use
def TF = "jenkins"

pipeline {
    // define which exact agent you want to run these instructions
    agent {
      label 'workernode-rac2'
    }
    parameters {
      choice(name: 'Action', choices: 'apply\nnoapply', description: 'Manual build stages')
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout scm
            }
        }  

        
        stage('terraform initialize') {
            steps {
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                dir("${WORKSPACE}") {
                sh 'terraform init' // initializes your terraform env
                }
              }
            }
        }
        
        stage("plan") {
          steps {
            // withCredentials passes your aws access key credentials thats stored in jenkins
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    dir("${WORKSPACE}") {
                    sh 'terraform plan' //checks what will be created before actually creating resources 
                    }
            }
          }
        }
        
        stage("apply") {
          when { expression { params.Action == 'apply' } }
          steps {
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    dir("${WORKSPACE}") {
                    sh 'terraform apply --auto-approve' //actually creates the resoruces and auto approved to bypass manual approval for automation
                    }
            }
          }
        }
    }

  post{
    always {  
      cleanWs()           
    }      
  }
} 
          
