// global variable used to determine which terraform folder to use
def TF = "eks"

pipeline {
    // define which exact agent you want to run these instructions
    agent {
        label 'workernode1'
    }
    tools {
        terraform 'tf_test' //set up this name in jenkins
        }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Research-Associate-Internship/terraform.git']]])
        
            }
        }  

        
        stage('terraform initialize') {
            steps {
                dir("${WORKSPACE}/${TF}") {
                sh 'ls'
                sh 'pwd'
                sh 'terraform init' // initializes your terraform env
                }
            }
        }
        
        stage("plan") {
          steps {
            // withCredentials passes your aws access key credentials thats stored in jenkins
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    dir("${WORKSPACE}/${TF}") {
                    sh 'terraform plan' //checks what will be created before actually creating resources 
                    }
            }
          }
        }
        
        stage("apply") {
          when { expression { params.Action == 'apply' } }
          steps {
            withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    dir("${WORKSPACE}/${TF}") {
                    echo 'hello'
                    //sh 'terraform apply --auto-approve' //actually creates the resoruces and auto approved to bypass manual approval for automation
                    }
            }
          }
        }
      
        // stage("destroy") {
        //   //Condition to only run this stage if you approve to run it
        //   input {
        //     message "Ready to destroy?"
        //     ok "Yes"
        //   }
          
        //   steps {
        //     withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        //             dir("${WORKSPACE}/Terraform/${TF}") {
        //             sh 'terraform destroy --auto-approve' //destroys all resources created for you 
        //             }
        //     }
        //   }
        // }
      
    }

  post{
    always {  
      cleanWs()           
    }      
  }
}
          
