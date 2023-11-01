resource "aws_ecr_repository" "ecr-rac3" {
  name                 = "devsecops-rac3-registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Department = "DevSecOps Associate"
    project    = "interns"
    Creation   = "terraform"
  }
}
