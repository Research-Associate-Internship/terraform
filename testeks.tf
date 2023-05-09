resource "aws_eks_cluster" "devsecops {
  name     = "betty-cluster"
  role_arn = aws_iam_role.devsecops.arn

  vpc_config {
    subnet_ids = [module.vpc.public_subnets[0], ]
  }

}