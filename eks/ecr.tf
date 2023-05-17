resource "aws_ecr_repository" "ecr" {
  name                 = "devsecops-registry"
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
