
terraform {
  backend "s3" {
    bucket = "rac2-nextgends"
    key    = "terraform.state"
    region = "us-east-1"
  }
}