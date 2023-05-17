terraform {
  backend "s3" {
    bucket = "s3-devsecops"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
    // profile = "aws-ds-s3"
  }
}
