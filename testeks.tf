resource "aws_eks_cluster" "betty-cluster" {
  name     = "betty-cluster"
  role_arn = aws_iam_role.betty-cluster.arn

  vpc_config {
    subnet_ids = [module.vpc.public_subnets[0], ]
  }

}