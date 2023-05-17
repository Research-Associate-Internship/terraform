terraform {
  backend "s3" {
    bucket = "s3-devsecops"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
    // profile = "aws-ds-s3"
  }
}
